@extends('layouts.main')
@extends('layouts.sidebar')

@section('content')

    <div class="card">"
        <div class="card-header">
           <h4> Form Laporan Kehilangan</h4>
           <h4>--------------------------</h4>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>NIK Pelapor</label>
                    <input type="text" class="form-control"  value="{{$pelapor->pelapor_nik}}" readonly >
                </div>

                <div class="form-group col-md-6">
                    <label>Nama Pelapor</label>
                    <input type="text" class="form-control" id="pelapor_nama" name="pelapor_nama" value="{{$pelapor->pelapor_nama}}" readonly >
                </div>
            </div>
        </div>

        <div class="card-body">

            <form method="POST" id="formlaporan" action="{{ url('/kelolalaporan/create') }}">

                {{ csrf_field() }}

                <input type="text" class="form-control" id="pelapor_nik" name="pelapor_nik" value="{{$pelapor->pelapor_nik}}" hidden >
                <input type="text" class="form-control" id="user_nrp" name="user_nrp" value="{{ Auth::user()->user_nrp }}" hidden>


                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label for="laproan_no">Nomor Laporan</label>
                        <input type="text" class="form-control" id="laporan_no" name="laporan_no" placeholder="nomor laporan" >
                    </div>

                    <div class="form-group col-md-3">
                        <label for="laporan_tglhilang">Waktu Kejadian :</label>
                        <input type="text" class="form-control datepicker-input" id="laporan_tglhilang" name="laporan_tglhilang" placeholder="yyyy-mm-dd" >
                    </div>

                    <div class="form-group col-md-6">
                        <label for="laproan_lokasi">Lokasi Kejadian</label>
                        <textarea type="text" class="form-control" id="laporan_lokasi" name="laporan_lokasi" placeholder="lokasi kejadian" ></textarea>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="laproan_keterangan">Keterangan Laproan</label>
                        <textarea type="text" class="form-control" id="laporan_keterangan" name="laporan_keterangan" placeholder="keterangan laporan" ></textarea>
                    </div>


                </div>




                <h5> Keterangan Surat Berharga / Barang yang Hilang</h5>
                <h5>--------------------------------------------------</h5>


                 <div class="form">

                    <div class="form-group col-md-6">
                        <label for="jenis_id">Jenis Kehilangan</label>
                        <select class="form-control" id="jenis_id" name="jenis_id">
                            <option selected>Pilih Jenis Kehilangan</option>
                        </select>
                    </div>

                     <div class="form-group col-md-6">
                         <label for="nama_pemilik">Atas Nama :</label>
                         <input type="text" class="form-control" id="nama_pemilik" name="nama_pemilik" placeholder="nama" >
                     </div>

                     <div class="form-group col-md-6">
                         <label for="detail_laporan_ket">Penjelasan Barang / Surat Berharga :</label>
                         <textarea type="text" class="form-control" id="detail_laporan_ket" name="detail_laporan_ket" placeholder="..." ></textarea>
                     </div>

                 </div>

                <div class="modal-footer">
                    <a type="button" class="btn btn-default" data-dismiss="modal" href="{{ url('kelolapelapor/') }}">Kembali</a>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>

            </form>

        </div>

    </div>


@endsection

@section('js')

    <script type="text/javascript">



        {{--$('#formlaporan').submit(function(e) {--}}
        {{--    e.preventDefault();--}}
        {{--    $.ajax({--}}
        {{--        url: $(this).attr('action')+'?_token='+'{{ csrf_token() }}',--}}
        {{--        type: 'post',--}}
        {{--        data: {--}}
        {{--            'laporan_no' : $('#laporan_no').val(),--}}
        {{--            'user_nrp' : $('#user_nrp').val(),--}}
        {{--            'pelapor_nik' :$('#pelapor_nik').val(),--}}
        {{--            'laporan_tglhilang' :$('#laporan_tglhilang').val(),--}}
        {{--            'laporan_lokasi' :$('#laporan_lokasi').val(),--}}
        {{--            'laporan_keterangan' :$('#laporan_keterangan').val(),--}}
        {{--            'jenis_id' :$('#jenis_id').val(),--}}
        {{--            'nama_pemiilik' :$('#nama_pemilik').val(),--}}
        {{--            'detail_laporan_ket' :$('#detail_laporan_ket').val(),--}}
        {{--        },--}}
        {{--        success :function () {--}}
        {{--        }--}}
        {{--    });--}}
        {{--});--}}


        $.ajax({
            url: '{{ url('kelolalaporan/listjenis') }}',
            dataType: "json",
            success: function(data) {
                var jenis = jQuery.parseJSON(JSON.stringify(data));
                $.each(jenis, function(k, v) {
                    $('#jenis_id').append($('<option>', {value:v.jenis_id}).text(v.jenis_nama))
                })
            }
        });

    </script>

@endsection
