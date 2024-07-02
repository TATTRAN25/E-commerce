<?php

namespace App\Http\Controllers;

use Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;


class UserController extends Controller
{
    public function MaGiamGia()
    {
        return view('product.MaGiamGia');
    }

    public function ranking()
    {
        return view('product.ranking');
    }

    public function index()
    {
        return view('products.index');
    }

}
