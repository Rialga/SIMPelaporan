@extends('layouts.main')
@extends('layouts.sidebar')

@section('content')

    <div class="card">
        <div class="card-header">
            <h4 class="card-title">
                <button class="btn btn-primary m-r-5" id="adduser">
                    <i class="anticon anticon-plus"></i>
                    Add User
                </button>
            </h4>
        </div>

{{--        TABEL USER--}}
        <div class="card-body">
            <table id="tuser" class="table">
                <thead>
                <tr>
                    <th>Nama</th>
                    <th>Pangkat</th>
                    <th>Role</th>
                    <th>Aksi</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

{{--    MODAL DAN FORM DATA USER--}}
    <div class="modal fade" id="muser">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Form User</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <i class="anticon anticon-close"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="formuser">
                        {{ csrf_field() }}
                        <div class="form-group">
                            <label for="nrp">NRP</label>
                            <input type="number" class="form-control" id="nrp" name="nrp" placeholder="NRP">
                        </div>

                        <div class="form-group">
                            <label for="nama">Nama</label>
                            <input type="text" class="form-control" id="nama" name="nama" placeholder="Nama">
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="role">Role</label>
                                <select class="form-control" id="role" name="role">
                                    <option selected>Pilih Role</option>
                                    <option></option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="pangkat">Pangkat</label>
                                <input type="text" class="form-control" id="pangkat" name="pangkat" placeholder="Pangkat">
                            </div>
                        </div>


                        <div class="form-group" id="div_password">
                            <div class="form-group col-md-12">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Keluar</button>
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


    {{--    MODAL DAN FORM DETAIL USER--}}
    <div class="modal fade" id="mduser">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Detial User</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <i class="anticon anticon-close"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <form>

                        <div class="card">
                            <div class="card-body">
                                <table width="400">
                                    <tr>
                                        <td>
                                            <a class="text-gray">NRP</a>
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <a class="text-gray" id="dnrp"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a class="text-gray">Nama</a>
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <a class="text-gray" id="dnama"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a class="text-gray">Pangkat</a>
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <a class="text-gray" id="dpangkat"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a class="text-gray">Role</a>
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <a class="text-gray" id="drole"></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Keluar</button>
                        </div>

                    </form>
                </div>
            </div>
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
                $('#tuser').dataTable({
                    "ajax": "{{ url('/kelolauser/data') }}",
                    "columns": [
                        { "data": "user_nama" },
                        { "data": "user_pangkat" },
                        { "data": "role.role_name"},
                        {
                            data: 'user_nrp',
                            sClass: 'text-right',
                            render: function(data) {
                                return'<a href="#" data-id="'+data+'" id="detail" class="text-info" title="detail"><i class="anticon anticon-eye"></i></i> </a> &nbsp;'+
                                    '<a href="#" data-id="'+data+'" id="edit" class="text-warning" title="edit"><i class="anticon anticon-edit"></i> </a> &nbsp;'+
                                    '<a href="#" data-id="'+data+'" id="delete" class="text-danger" title="hapus"><i class="anticon anticon-delete"></i> </a>';
                            }
                        }
                    ],
                    columnDefs: [
                        {
                            width: "250px",
                            targets: [0]
                        },
                        {
                            width: "200px",
                            targets: [1]
                        },
                        {
                            width: "200px",
                            targets: [2]
                        },
                        {
                            width: "150px",
                            targets: [3]
                        },
                    ],
                    scrollX: true,
                    scrollY: '350px',
                    scrollCollapse: true,
                });
            } loadData();


            $(document).on('click', '#adduser', function() {
                $('#muser').modal('show');
                document.getElementById('div_password').style.display = 'block';
                $('#formuser').attr('action', '{{ url('kelolauser/create') }}');
            });

            $('#formuser').submit(function(e) {
                e.preventDefault();
                $.ajax({
                    url: $(this).attr('action')+'?_token='+'{{ csrf_token() }}',
                    type: 'post',
                    data: {
                        'user_nrp': $('#nrp').val(),
                        'user_nama': $('#nama').val(),
                        'role_id': $('#role').val(),
                        'user_pangkat': $('#pangkat').val(),
                        'password': $('#password').val(),
                    },
                    success :function () {

                        $('#tuser').DataTable().destroy();
                        loadData();
                        $('#muser').modal('hide');
                    }
                });
            });

            $(document).on('click', '#edit', function() {
                var data = $('#tuser').DataTable().row($(this).parents('tr')).data();
                $('#muser').modal('show');
                document.getElementById('div_password').style.display = 'none';
                $('#nrp').val(data.user_nrp).change();
                $('#nama').val(data.user_nama).change();
                $('#pangkat').val(data.user_pangkat).change();
                $('#role').val(data.role_id).change();
                $('#formuser').attr('action', '{{ url('kelolauser/update') }}/'+data.user_nrp);
            });

            $(document).on('click', '#detail', function() {
                var data = $('#tuser').DataTable().row($(this).parents('tr')).data();
                $('#mduser').modal('show');
                $('#dnrp').text(data.user_nrp);
                $('#dnama').text(data.user_nama);
                $('#dpangkat').text(data.user_pangkat);
                $('#drole').text(data.role.role_name);
            });

            $(document).on('click', '#delete', function() {
                var id = $(this).data('id');
                if (confirm("Yakin ingin menghapus data?")){
                    $.ajax({
                        url : "{{ url('kelolauser/delete') }}/"+id,

                        success :function () {

                            $('#tuser').DataTable().destroy();
                            loadData();


                        }
                    })
                }
            });


            $.ajax({
                url: '{{ url('user/listrole') }}',
                dataType: "json",
                success: function(data) {
                    var role = jQuery.parseJSON(JSON.stringify(data));
                    $.each(role, function(k, v) {
                        $('#role').append($('<option>', {value:v.role_id}).text(v.role_name))
                    })
                }
            });


            $('#muser').on('hidden.bs.modal', function () {
                $(this).find('form').trigger('reset');
            });
        });

    </script>
@endsection
