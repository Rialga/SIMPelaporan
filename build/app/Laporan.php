<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Laporan extends Model
{
    protected $table = 'laporan';
    protected $primaryKey = 'laporan_no';
    protected $fillable = [
        'laporan_no','user_nrp' , 'pelapor_nik' , 'laporan_tgllapor' ,'laporan_tglhilang',
        'laporan_lokasi' , 'laporan_keterangan'
    ];

    public function user() {
        return $this->belongsTo('App\User', 'user_nrp', 'uer_nrp');
    }

    public function pelapor() {
        return $this->belongsTo('App\Pelapor', 'pelapor_nik', 'pelapor_nik');
    }




}
