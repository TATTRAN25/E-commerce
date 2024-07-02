@extends('layouts.app')

@section('title', 'Vouchers')

@section('content')
<div class="container">
    <h1>Edit Voucher</h1>
    <form action="{{ route('vouchers.update', $voucher->voucher_id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="voucher_name">Voucher Name:</label>
            <input type="text" name="voucher_name" class="form-control" value="{{ $voucher->voucher_name }}" required>
        </div>
        <div class="form-group">
            <label for="voucher_quantity">Voucher Quantity:</label>
            <input type="number" name="voucher_quantity" class="form-control" value="{{ $voucher->voucher_quantity }}" required>
        </div>
        <div class="form-group">
            <label for="discount_percentage">Discount Percentage:</label>
            <input type="text" name="discount_percentage" class="form-control" value="{{ $voucher->discount_percentage }}" required>
        </div>
        <div class="form-group">
            <label for="begin_date">Begin Date:</label>
            <input type="date" name="begin_date" class="form-control" value="{{ $voucher->begin_date }}" required>
        </div>
        <div class="form-group">
            <label for="end_date">End Date:</label>
            <input type="date" name="end_date" class="form-control" value="{{ $voucher->end_date }}" required>
        </div>
        <div class="form-group">
            <label for="voucher_detail">Voucher Detail:</label>
            <input type="text" name="voucher_detail" class="form-control" value="{{ $voucher->voucher_detail }}" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
@endsection
