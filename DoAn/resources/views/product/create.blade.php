@extends('layout')

@section('title', 'Create Voucher')

@section('content')
<div class="container">
    <h1>Create Voucher</h1>
    <form action="{{ route('vouchers.store') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="voucher_name">Voucher Name:</label>
            <input type="text" name="voucher_name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="voucher_quantity">Voucher Quantity:</label>
            <input type="number" name="voucher_quantity" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="discount_percentage">Discount Percentage:</label>
            <input type="text" name="discount_percentage" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="begin_date">Begin Date:</label>
            <input type="date" name="begin_date" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="end_date">End Date:</label>
            <input type="date" name="end_date" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="voucher_detail">Voucher Detail:</label>
            <input type="text" name="voucher_detail" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
@endsection
