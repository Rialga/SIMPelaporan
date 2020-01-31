@extends('layouts.main')
@extends('layouts.sidebar')

@section('content')

<div class="card">

    <div class="card-header">
        <div class="card-title">
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label> Masukkan Tanggal :</label>
                    <form id="cari" >
                        {{ csrf_field() }}
                        <div class="d-flex align-items-center">
                            <input type="text" class="form-control datepicker-input" id="start"  name="start" placeholder="Awal">
                            <span class="p-h-10">dan</span>
                            <input type="text" class="form-control datepicker-input" id="end" name="end" placeholder="Akhir">
                            <span class="p-h-10"></span>
                            <button id="btncari" type="submit" class="btn btn-primary">Cari</button>
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
        <table id="tdownload" class="table">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>LAPORAN POLISI</th>
                    <th>WAKTU HILANG</th>
                    <th>WAKTU MELAPORKAN</th>
                    <th>TEMPAT KEJADIAN</th>
                    <th>IDENTITAS PELAPOR</th>
                    <th>BENDA / SURAT BERHARGA YANG DILAPORKAN</th>
                </tr>
            </thead>
        </table>
    </div>

</div>
@endsection
@section('js')
    <script src="assets/vendors/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/vendors/datatables/dataTables.bootstrap.min.js"></script>


    <script type="text/javascript">

        $(document).ready(function() {
            $.extend( $.fn.dataTable.defaults, {
                responsive: true,
                autoWidth: true,
                language: {
                    search: '<span>Cari:</span> _INPUT_',
                    searchPlaceholder: 'Cari...',
                    paginate: { 'first': 'First', 'last': 'Last', 'next': $('html').attr('dir') == 'rtl' ? '&larr;' : '&rarr;', 'previous': $('html').attr('dir') == 'rtl' ? '&rarr;' : '&larr;' }
                }
            });

            function loadData() {
                var no = 1;
                var t = $('#tdownload').dataTable({
                    "ajax": "{{ url('/downloadlaporan/data') }}",
                    "columns": [

                        { "data": "laporan_no" },
                        { "data": "laporan_no" },
                        { "data": "laporan_tglhilang"},
                        { "data": "laporan_tgllapor"},
                        { "data": "laporan_lokasi"},
                        { "data": function (data) {
                            return '<b> A.N :</b> '+data.pelapor.pelapor_nama+' <br/>'+
                                   '<b> Alamat :</b>'+data.pelapor.pelapor_alamat+' <br/>'+
                                   '<b> Pekerjaan :</b>'+data.pelapor.pelapor_pekerjaan+' <br/>'+
                                   '<b> Usia :</b>'+data.pelapor.pelapor_tgl_lahir+'';
                        }},
                        { "data": "jenis"}
                    ],

                    columnDefs: [
                        {
                            width: "10px", targets: [0],
                            render: function (data) {
                                return no++;
                            }

                        } ,
                        {
                            width: "100px", targets: [1]

                        } ,
                        {
                            width: "100px", targets: [2]

                        } ,
                        {
                            width: "100px", targets: [3]
                        },
                        {
                            width: "200px", targets: [4]
                        },
                        {
                            width: "250px", targets: [5]
                        },
                        {
                            width: "300px", targets: [6],
                            render: function (data, type, full, meta) {
                                var hasil = '';
                                data.forEach((item, id)=>{
                                    hasil += '- '+item.jenis_nama+'<br> ';
                                });
                                return hasil;
                            }
                        },
                    ],

                    scrollX: true,
                    scrollY: "375",
                    scrollCollapse: true,
                    paging: false,
                    info: false,
                });
            } loadData();



            $('#btncari').click(function () {
                $('#formpelapor').submit(function(e)     {
                    e.preventDefault();
                    $.ajax({
                        url: "{{ url('/downloadlaporan/data') }}",
                        type: 'post',
                        data: {
                            'start': $('#start').val(),
                            'end': $('#end').val(),
                        },
                        success :function () {
                            loadData();
                        }
                    });
                });
            });

            {{--$(document).on('click', '#addpelapor').attr('{{ url('kelolapelapor/create') }}');--}}

        });
    </script>



@endsection
