<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DocPendukung extends Model
{

    protected $table = 'doc_pendukung';
    protected $primaryKey = 'doc_pendukung_id';
    protected $fillable = [
        'doc_pendukung_file' , 'doc_pendukung_nama'
    ];

    public function laporan(){
        return $this->hasMany('App\Laporan','doc_pendukung_id','doc_pendukung_id');
    }

}
