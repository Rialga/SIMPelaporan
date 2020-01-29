<?php

namespace App\Http\Controllers;

use App\DetailLaporan;
use App\DocPendukung;
use App\Jenis;
use App\Laporan;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Pelapor;
use DateTime;
use DataTables;
use Excel;
use App\Exports\LaporanExport;
class KelolalaporanController extends Controller
{
    public function addlaporan($id)
    {
        $pelapor = Pelapor::where('pelapor_nik',$id)->first();
        return view('addlaporan',['pelapor'=>$pelapor]);
    }

    public function listjenis(){
        $jenis  = Jenis::all();
            return json_encode($jenis);
    }

    public function create(Request $request){



        $file = $request->file('doc_pendukung_file');
        $nama_file = $file->getClientOriginalName();


        $tujuan_upload = 'DocumentLaporan';
        $file->move($tujuan_upload,$nama_file);

        $upload = new DocPendukung;
        $upload->doc_pendukung_file = $nama_file;
        $upload->doc_pendukung_nama = $request->doc_pendukung_nama;
        $upload->save();


        $waktu = Carbon::now();

        $laporan = new Laporan;
        $laporan->pelapor_nik = $request->pelapor_nik;
        $laporan->laporan_no = $request->laporan_no;
        $laporan->laporan_tgllapor = $waktu->toDateTimeString();
        $laporan->user_nrp = $request->user_nrp;
        $laporan->doc_pendukung_id  = DocPendukung::all()->last()->doc_pendukung_id;
        $laporan->pelapor_nik = $request->pelapor_nik;
        $laporan->laporan_tglhilang = $request->laporan_tglhilang;
        $laporan->laporan_lokasi = $request->laporan_lokasi;
        $laporan->laporan_keterangan = $request->laporan_keterangan;
        $laporan->save();

        for ($i = 0; $i < count($request->jenis_id); $i++) {
            $detaillaporan = new DetailLaporan;
            $detaillaporan->laporan_no = $request->laporan_no;
            $detaillaporan->jenis_id = $request->jenis_id[$i];
            $detaillaporan->nama_pemilik = $request->nama_pemilik[$i];
            $detaillaporan->detail_laporan_ket = $request->detail_laporan_ket[$i];

            $detaillaporan->save();
        }

        $id = $request->laporan_no;
        return $this->print($id);


    }

    public function data()
    {


        $detail_laporan = Laporan::with(['pelapor'])->get();

        return DataTables::of($detail_laporan)->toJson();
    }


    public function print($id)
    {
        $detail = DetailLaporan::with(['laporan'])->where('laporan_no',$id)->first();
        $detail2 = DetailLaporan::with(['laporan'])->where('laporan_no',$id)->get();
        $umur = Carbon::parse($detail->laporan->pelapor->pelapor_tgl_lahir)->age;
        $tgllapor = Carbon::parse($detail->laporan->laporan_tgllapor)->format('d/m/Y');
        $tglhilang = Carbon::parse($detail->laporan->laporan_tglhilang)->format('d/m/Y');
        $dayhilang = Carbon::parse($detail->laporan->laporan_tglhilang)->format('D');

        $jamlapor = Carbon::parse($detail->laporan->laporan_tgllapor)->format('H:i');



        return view('laporan',['detail'=>$detail,
                                        'detail2'=>$detail2,
                                        'umur'=>$umur,
                                        'tgllapor'=>$tgllapor,
                                        'tglhilang'=>$tglhilang,
                                        'jamlapor'=>$jamlapor,
                                        'dayhilang'=>$dayhilang]);
    }

    public function excel(){
        $data = Laporan::all();
        return view('excel' ,['data'=>$data]);
    }

    public function excelexport(){
        $nama_file = 'laporan_kecelakaan'.date( 'Y-m-d_H-i-s').'.xlsx';
        return Excel::download(new LaporanExport, $nama_file);
    }
}
