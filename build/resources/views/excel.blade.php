@extends('layouts.main')
@extends('layouts.sidebar')

@section('content')

    <div class="card">

        <div class="card-header">
            <div class="card-title">
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label> Masukkan Tanggal :</label>
                        <form method="POST" id="cari" action="" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <div class="d-flex align-items-center">
                                <input type="text" class="form-control datepicker-input" name="start" placeholder="Awal">
                                <span class="p-h-10">dan</span>
                                <input type="text" class="form-control datepicker-input" name="end" placeholder="Akhir">
                                <span class="p-h-10"></span>
                                <a class="btn btn-primary m-r-5" >CARI</a>
                            </div>
                        </form>
                    </div>

                    <div class="form-group col-md-6">
                        <a style="position: absolute; right: 0;" class="btn btn-primary m-r-5" href='{{ url('kelolalaporan/exportexcel') }}'>
                            <i class="anticon anticon-download"></i>
                            Excel
                        </a>
                    </div>

                </div>
            </div>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <tr style="text-align: center">
                        <th>NO</th>
                        <th>LAPORAN POLISI</th>
                        <th>WAKTU KEHILANGAN</th>
                        <th>WAKTU MELAPORKAN</th>
                        <th>TEMPAT KEJADIAN</th>
                        <th>IDENTITAS PELAPOR</th>
                        <th>BENDA / SURAT BERHARGA YANG DILAPORKAN</th>
                    </tr>

                    @foreach($data as $detail_laporan)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{ $detail_laporan->laporan_no }}</td>
                        <td>{{ date('d/m/Y',strtotime($detail_laporan->laporan_tglhilang)) }}</td>
                        <td>
                            Tgl : {{ date('d/m/Y',strtotime($detail_laporan->laporan_tgllapor)) }} , Pukul : {{ date('H:i',strtotime($detail_laporan->laporan_tgllapor)) }} WIB
                        </td>
                        <td>{{ $detail_laporan->laporan_lokasi}}</td>
                        <td>
                            <b> AN: </b>{{ $detail_laporan->pelapor->pelapor_nama}} , <b>Pekerjaan</b> : {{ $detail_laporan->pelapor->pelapor_pekerjaan}} , <b>Alamat</b> : {{ $detail_laporan->pelapor->pelapor_alamat}}
                        </td>

                        <td>
                            @foreach($detail_laporan->jenis as $h)
                                 {{ $h->jenis_nama }} ,
                            @endforeach
                        </td>
                    </tr>
                    @endforeach

                </table>
            </div>
        </div>
    </div>
@endsection
