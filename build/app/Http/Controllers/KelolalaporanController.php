<?php

namespace App\Http\Controllers;

use App\DetailLaporan;
use App\Jenis;
use App\Laporan;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Pelapor;
use DateTime;
use DataTables;

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

        $now = new DateTime();

        $laporan = new Laporan;
        $laporan->pelapor_nik = $request->pelapor_nik;
        $laporan->laporan_no = $request->laporan_no;
        $laporan->laporan_tgllapor = $now;
        $laporan->user_nrp =$request->user_nrp;
        $laporan->pelapor_nik =$request->pelapor_nik;
        $laporan->laporan_tglhilang =$request->laporan_tglhilang;
        $laporan->laporan_lokasi =$request->laporan_lokasi;
        $laporan->laporan_keterangan =$request->laporan_keterangan;
        $laporan->save();

        $detaillaporan = new DetailLaporan;
        $detaillaporan->laporan_no = $request->laporan_no;
        $detaillaporan->jenis_id = $request->jenis_id;
        $detaillaporan->nama_pemilik = $request->nama_pemilik;
        $detaillaporan->detail_laporan_ket = $request->detail_laporan_ket;

        $detaillaporan->save();

        $id = $request->laporan_no;
        return $this->print($id);


    }

    public function data()
    {
        $detail_laporan = DetailLaporan::with(['laporan','jenis'])->get();
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
}
