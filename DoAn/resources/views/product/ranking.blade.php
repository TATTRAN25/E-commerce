@extends('layout')

@section('title', 'Checkout')
@section('content')

    <div class="row">
        <div class="column">
            <img class="column"  src="{{ asset('images/1694392895130.png')}}" alt="Áo len">
            <div class="column text-h1">
                <h1>Áo len tay lỡ form rộng unisex, Áo len nam nữ form rộng</h1>
                <p class="price">11.000.000đ - <del>22.000.000</del></p>
                <div class="column">
            <h3><b>Đánh giá sản phẩm </b></h3>
            <input class="textbox" type="text" placeholder="Nhập đánh giá ....">
            <div class="button">
                <button class="btn">Tất cả</button>
                <button class="btn">5 sao (11)</button>
                <button class="btn">dưới 5 sao</button>
            </div>
            <div class="author">
                <button class="btn-1"></button>
                Anh long
                <i class="fa-sharp fa-solid fa-star"></i>
                <i class="fa-sharp fa-solid fa-star"></i>
                <i class="fa-sharp fa-solid fa-star"></i>
                <i class="fa-sharp fa-solid fa-star"></i>
                <i class="fa-sharp fa-solid fa-star"></i>
                <p>Sản phẩm rất tốt</p>

            </div>
        </div>
            </div>
            
        </div>

        

    </div>

    @endsection