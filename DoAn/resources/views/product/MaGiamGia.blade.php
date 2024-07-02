@extends('layout')

@section('title', 'Checkout')
@section('content')

    <div class="main">
        <img class="product-image" src="{{ asset('images/1694392895130.png')}}" alt="Áo len">
        <div class="product-info">
            <h1 class="text-h2">Tạo Mã Giảm Giá</h1>
                <form action="{{ route('voucher.store') }}" method="POST">
                @csrf
                    <div class="row">
                        <div class="col"><label>Mã giảm giá: </label><input name="magiamgia" type="text" required></div>
                        <div class="col"><label>Tên mã: </label><input name="tenma" type="text" required></div>
                    </div>
                    <div class="row">
                        <div class="col"><label>Số lượng: </label><input name="soluong" type="text" required></div>
                        <div class="col"><label>Giá trị: </label><input name="giatri" type="text" required></div>
                        <div class="col"><label>Hạn sử dụng: </label><input name="hansudung" type="text" required></div>
                    </div>
                    <div class="row">
                        <div class="col"><label>Mô tả: </label><input name="mota" type="text" required></div>
                    </div>
                    @csrf
                        <!-- Các trường input khác -->
                        <button type="submit">Submit</button>
                </form>        
            </div>

        </div>
    </div>



@endsection