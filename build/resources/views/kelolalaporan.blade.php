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
             <table id="tlaporan" class="table">
                 <thead>
                 <tr>
                     <th>No Laporan</th>
                     <th>Nama Pelapor</th>
                     <th>Tanggal Lapor</th>
                     <th>Aksi</th>
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
                autoWidth: false,
                language: {
                    search: '<span>Cari:</span> _INPUT_',
                    searchPlaceholder: 'Cari...',
                    lengthMenu: '<span>Tampil:</span> _MENU_',
                    paginate: { 'first': 'First', 'last': 'Last', 'next': $('html').attr('dir') == 'rtl' ? '&larr;' : '&rarr;', 'previous': $('html').attr('dir') == 'rtl' ? '&rarr;' : '&larr;' }
                }
            });

            function loadData() {
                $('#tlaporan').dataTable({
                    "ajax": "{{ url('/kelolalaporan/data') }}",
                    "columns": [
                        { "data": "laporan_no" },
                        { "data": "pelapor.pelapor_nama"},
                        { "data": "laporan_tgllapor"},
                        {
                            data: 'detail_laporan_id',
                            sClass: 'text-center',
                            render: function(data) {
                                return'<a href="#" data-id="'+data+'" id="print" class="text-danger" title="print"><i class="anticon anticon-printer"></i> </a>';
                            }
                        }
                    ],
                    columnDefs: [
                        {
                            width: "200px",
                            targets: [0]
                        },
                        {
                            width: "250px",
                            targets: [1]
                        },
                        {
                            width: "250px",
                            targets: [2]
                        },
                        {
                            width: "100px",
                            targets: [3]
                        },
                    ],
                    scrollX: true,
                    scrollY: '350px',
                    scrollCollapse: true,
                });
            } loadData();

            $(document).on('click', '#print', function() {
                var data = $('#tlaporan').DataTable().row($(this).parents('tr')).data();
                window.location.href = '{{ url('kelolalaporan/print') }}/'+data.laporan_no ;
            });

    });


    </script>
@endsection
