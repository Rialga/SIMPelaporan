<?php

namespace App\Http\Controllers;

use App\Jabatan;
use App\Pangkat;
use App\Role;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Auth;
use DataTables;
class UserController extends Controller
{

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'nama' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:user'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    public function data()
    {
        $user = User::with(['role','pangkat'])->get();
        return DataTables::of($user)->toJson();
    }

    public function create(Request $request){
        $valid = User::where('user_nrp',$request->user_nrp)->count();

        if($valid != 0){
             $message = ['error' => 'Data Telah ada,Gagal menambahkan!'];
             return response()->json($message);
        }

        else{

         $user = new User;
         $user->user_nrp = $request->user_nrp;
         $user->user_nama = $request->user_nama;
         $user->pangkat_id = $request->pangkat_id;
         $user->role_id = $request->role_id;
         $user->password = Hash::make($request['password']);


         $user->save();
        }
    }

    public function update(Request $request,$id){

        $user = User::where('user_nrp',$id)->first();
        $user->user_nama = $request->user_nama;
        $user->pangkat_id = $request->pangkat_id;
        $user->role_id = $request->role_id;
        $user->update();
    }

    public function delete($id)
    {

      User::where('user_nrp', $id)->delete();

    }

    public function listrole(){
        $role = Role::all();
        return json_encode($role);
    }

    public function listpangkat(){
        $role = Pangkat::all();
        return json_encode($role);
    }

}
