<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailLaporan extends Model
{
    protected $table = 'detail_laporan';
    protected $primaryKey = 'detail_laporan_id';
    protected $fillable = [
        'laporan_no' , 'jenis_id' , 'detail_laporan_ket'
    ];


    public function laproan() {
        return $this->belongsTo('App\Laporan', 'laporan_no', 'laporan_no');
    }

    public function jenis() {
        return $this->belongsTo('App\Laporan', 'jenis_id', 'jenis_id');
    }
}
