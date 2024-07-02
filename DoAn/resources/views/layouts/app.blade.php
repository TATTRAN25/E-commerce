
<header class="header">
    <nav class="nav-prefix">
        <a href="#" class="nav-logo-prefix">
            <img class="logo-img" src="{{asset('images/logo.png')}}" alt="Logo Shop">
        </a>

        <div class="nav-menu-prefix">
            <ul class="nav-list-prefix">
                <li class="nav-item-prefix"><a href="#" class="nav-link-prefix">Trang chủ</a></li>
                <li class="nav-item-prefix"><a href="#" class="nav-link-prefix">Sản phẩm</a></li>
                <li class="nav-item-prefix"><a href="#" class="nav-link-prefix">Tiện ích</a></li>
                <li class="nav-item-prefix"><a href="#" class="nav-link-prefix">Liên hệ</a></li>
            </ul>
        </div>

        <div class="nav-search-prefix">
            <input type="text" placeholder="Tìm kiếm sản phẩm" class="form-input-prefix"/>
            <button class="search-btn-prefix">
                <i class="search-icon fa-solid fa-magnifying-glass"></i>
            </button>
        </div>

        <div class="nav-user-action-prefix">
            <a href=""><i class="user-icon fa-solid fa-user"></i></a>
            <a href=""><i class="cart-icon fa-solid fa-cart-shopping"></i></i></a>
        </div>
    </nav>
</header>


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


<footer>
    <footer>
    <div class="footer-container">
        <div class="footer-left">
            <h3>Thông tin liên hệ</h3>
            <p>Địa chỉ: 123 Đường ABC, Thành phố XYZ</p>
            <p>Email: example@example.com</p>
            <p>Điện thoại: 0123 456 789</p>
        </div>
        <div class="footer-right">
            <h3>Liên kết hữu ích</h3>
            <ul class="nav-footer-right">
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Sản phẩm</a></li>
                <li><a href="#">Dịch vụ</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
        </div>
    </div>
</footer>

</footer>
