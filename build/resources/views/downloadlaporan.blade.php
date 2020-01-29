@extends('layouts.main')
@extends('layouts.sidebar')

@section('content')

<div class="card">

    <div class="card-header">
        <h4 class="card-title">
            <a class="btn btn-primary m-r-5" href='kelolalaporan/excel'>
                <i class="anticon anticon-download"></i>
                Excel
            </a>
        </h4>
    </div>

    <div class="card-body">
        <table id="tdownload" class="table">
            <thead>
                <tr>
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
    <script src="assets/vendors/datatables/datetime.js"></script>
    <script src="assets/vendors/datatables/dataTables.bootstrap.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function() {
            $.extend( $.fn.dataTable.defaults, {
                responsive: true,
                autoWidth: false,
                language: {
                    search: '<span>Cari:</span> _INPUT_',
                    searchPlaceholder: 'Cari...',
                    lengthMenu: '<span>Tampil:</span> _MENU_',
                    paginate: { 'first': 'First', 'last': 'Last', 'next': $('html').attr('dir') == 'rtl' ? '&larr;' : '&rarr;', 'previous': $('html').attr('dir') == 'rtl' ? '&rarr;' : '&larr;' }
                }
            });

            function loadData() {
                $('#tdownload').dataTable({
                    "ajax": "{{ url('/downloadlaporan/data') }}",
                    "columns": [
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
                        { "data": "laporan.jenis.jenis_nama"}
                    ],
                    columnDefs: [
                        {
                            width: "200px", targets: [0]
                        },
                        {
                            width: "100px", targets: [1]

                        } ,
                        {
                            width: "100px", targets: [2]
                        },
                        {
                            width: "200px", targets: [3]
                        },
                        {
                            width: "250px", targets: [4]
                        },
                        {
                            width: "250px", targets: [5]
                        },
                    ],
                    scrollX: true,
                    scrollY: "375",
                    scrollCollapse: true,
                });
            } loadData();

        });


    </script>



@endsection
