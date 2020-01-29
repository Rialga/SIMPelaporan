<!DOCTYPE html>
<html>

<head>
    <title>Laporan Kehilangan</title>
</head>

<body>
    <table border="1">

        <a href='{{ url('kelolalaporan/exportexcel') }}'>download</a>
{{--        <tr>--}}
{{--            <th rowspan="2">NO</th>--}}
{{--            <th rowspan="2">LAPORAN POLISI</th>--}}
{{--            <th colspan="2">WAKTU KEJADIAN</th>--}}
{{--            <th rowspan="2">TEMPAT KEJADIAN</th>--}}
{{--            <th rowspan="2">IDENTITAS PELAPOR</th>--}}
{{--            <th rowspan="2">BENDA / SURAT BERHARGA YANG DILAPORKAN</th>--}}
{{--        </tr>--}}
        <tr>
            <th>NO</th>
            <th>LAPORAN POLISI</th>
            <th>WAKTU HILANG</th>
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
                <table>
                    <tr>
                        <td>Tanggal</td>
                        <td>:</td>
                        <td>TGL : {{ date('d/m/Y',strtotime($detail_laporan->laporan_tgllapor)) }} </td>
                    </tr>
                    <tr>
                        <td>Jam</td>
                        <td>:</td>
                        <td>Pukul : {{ date('H:i',strtotime($detail_laporan->laporan_tgllapor)) }} WIB</td>
                    </tr>
                </table>
            </td>
            <td>{{ $detail_laporan->laporan_lokasi}}</td>
            <td>
                <table>
                    <tr>
                        <td>NAMA</td>
                        <td>:</td>
                        <td>{{ $detail_laporan->pelapor->pelapor_nama}}</td>
                    </tr>
                    <tr>
                        <td>PEKERJAAN</td>
                        <td>:</td>
                        <td>{{ $detail_laporan->pelapor->pelapor_pekerjaan}}</td>
                    </tr>
                    <tr>
                        <td>ALAMAT</td>
                        <td>:</td>
                        <td>{{ $detail_laporan->pelapor->pelapor_alamat}}</td>
                    </tr>
                </table>
            </td>

            <td>
                @foreach($detail_laporan->jenis as $h)
                    <li> {{ $h->jenis_nama }} </li>
                @endforeach
            </td>
        </tr>
        @endforeach

    </table>
</body>

</html>
