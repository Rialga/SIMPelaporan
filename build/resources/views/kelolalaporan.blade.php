@extends('layouts.main')
@extends('layouts.sidebar')

@section('content')

 <div class="card">

     <div class="card-body">
         <table id="tlaporan" class="table">
             <thead>
             <tr>
                 <th>No Laporan</th>
                 <th>NIK Pelapor</th>
                 <th>Jenis Barang / Surat</th>
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
        function loadData() {
            $('#tlaporan').dataTable({
                "ajax": "{{ url('/kelolalaporan/data') }}",
                "columns": [
                    { "data": "laporan_no" },
                    { "data": "laporan.pelapor_nik"},
                    { "data": "jenis.jenis_nama"},
                    {
                        data: 'detail_laporan_id',
                        sClass: 'text-right',
                        render: function(data) {
                            return'<a href="#" data-id="'+data+'" id="detail" class="text-info" title="detail"><i class="anticon anticon-eye"></i></i> </a> &nbsp;'+
                                '<a href="#" data-id="'+data+'" id="print" class="text-danger" title="print"><i class="anticon anticon-delete"></i> </a>';
                        }
                    }
                ],
                columnDefs: [
                    {
                        width: "100px",
                        targets: [0]
                    },
                    {
                        width: "150px",
                        targets: [1]
                    },
                    {
                        width: "150px",
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
            window.location.href = '{{ url('kelolalaporan/print') }}/'+data.laporan.laporan_no ;
        });


    </script>
@endsection
