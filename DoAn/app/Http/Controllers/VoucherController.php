<?php
namespace App\Http\Controllers;

use App\Models\Voucher;
use Illuminate\Http\Request;

class VoucherController extends Controller
{
    public function index()
    {
        $vouchers = Voucher::all();
        return view('vouchers.index', compact('vouchers'));
    }

    public function create()
    {
        return view('product.MaGiamGia');
    }

    public function store(Request $request)
    {
        $request->validate([
            'voucher_id' => 'required|unique:vouchers',
            'voucher_name' => 'required',
            'voucher_quantity' => 'required|integer',
            'discount_percentage' => 'required|numeric',
            'begin_date' => 'required|date',
            'end_date' => 'required|date',
            'voucher_detail' => 'required'
        ]);

        Voucher::create($request->all());

        return redirect()->route('vouchers.index')->with('success', 'Voucher created successfully.');
    }

    public function destroy($voucher_id)
    {
        $voucher = Voucher::findOrFail($voucher_id);
        $voucher->delete();

        return redirect()->route('vouchers.index')->with('success', 'Voucher deleted successfully.');
    }
}
