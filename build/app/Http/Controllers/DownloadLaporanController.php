<?php

namespace App\Http\Controllers;

use App\DetailLaporan;
use App\Jenis;
use App\Pelapor;
use App\Laporan;
use Illuminate\Http\Request;
use Carbon\Carbon;
use DateTime;
use DataTables;

class DownloadLaporanController extends Controller
{


    public function view(){
        return view('downloadlaporan');
    }


    public function data()
    {
        $detail = Laporan::with(['pelapor'],['jenis'])->get();
        return DataTables::of($detail)->toJson();
    }
}
