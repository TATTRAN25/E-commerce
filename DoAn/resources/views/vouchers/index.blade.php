
@extends('layouts.app')

@section('title', 'Products')

@section('content')
<div class="container">
    <h1>Vouchers</h1>


    <a href="{{ route('product.index') }}" class="btn btn-primary">Create Voucher</a>
    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif
    <table class="table table-bordered">
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Discount Percentage</th>
            <th>Begin Date</th>
            <th>End Date</th>
            <th>Detail</th>
            <th width="280px">Action</th>
        </tr>
        @foreach ($vouchers as $voucher)
        <tr>
            <td>{{ $voucher->voucher_id }}</td>
            <td>{{ $voucher->voucher_name }}</td>
            <td>{{ $voucher->voucher_quantity }}</td>
            <td>{{ $voucher->discount_percentage }}</td>
            <td>{{ $voucher->begin_date }}</td>
            <td>{{ $voucher->end_date }}</td>
            <td>{{ $voucher->voucher_detail }}</td>
            <td>
                <form action="{{ route('vouchers.destroy', $voucher->voucher_id) }}" method="POST">
                    <a class="btn btn-info" href="{{ route('vouchers.edit',$voucher->voucher_id) }}">Edit</a>
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </td>
        </tr>
        @endforeach
    </table>
</div>
@endsection
