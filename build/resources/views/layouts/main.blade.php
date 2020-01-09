<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from themenate.com/enlink-bs/dist/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 Jan 2020 04:38:45 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sistem Informasi Pelaporan</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/logo/favicon.png">

    <!-- page css -->
    <link href="assets/vendors/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <!-- Core css -->
    <link href="assets/css/app.min.css" rel="stylesheet">
    <!-- page css -->
    <link href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">


</head>

<body>
<div class="app">
    <div class="layout">
        <!-- Header START -->
        <div class="header">
            <div class="logo logo-dark">
                <a>
                    <img src="assets/images/logo/logo.png" alt="Logo">
                    <img class="logo-fold" src="assets/images/logo/logo-fold.png" alt="Logo">
                </a>
            </div>
            <div class="logo logo-white">
                <a href="index.html">
                    <img src="assets/images/logo/logo-white.png" alt="Logo">
                    <img class="logo-fold" src="assets/images/logo/logo-fold-white.png" alt="Logo">
                </a>
            </div>
            <div class="nav-wrap">

                <ul class="nav-left">
                    <li class="desktop-toggle">
                        <a href="javascript:void(0);">
                            <i class="anticon"></i>
                        </a>
                    </li>
                    <li class="mobile-toggle">
                        <a href="javascript:void(0);">
                            <i class="anticon"></i>
                        </a>
                    </li>
                </ul>

                <ul class="nav-right">
                    <li class="dropdown dropdown-animated scale-left">
                        <div class="pointer" data-toggle="dropdown">
                            <div class="avatar avatar-image  m-h-10 m-r-15">
                                <img src="assets/images/avatars/thumb-3.jpg"  alt="">
                            </div>
                        </div>
                        <div class="p-b-15 p-t-20 dropdown-menu pop-profile">
                            <div class="p-h-20 p-b-15 m-b-10 border-bottom">
                                <div class="d-flex m-r-50">
                                    <div class="avatar avatar-lg avatar-image">
                                        <img src="assets/images/avatars/thumb-3.jpg" alt="">
                                    </div>
                                    <div class="m-l-10">
                                        <p class="m-b-0 text-dark font-weight-semibold">{{ Auth::user()->user_nama }}</p>
                                        <p class="m-b-0 opacity-07">{{ Auth::user()->user_pangkat }}</p>
                                    </div>
                                </div>
                            </div>
                            <a href="{{ route('logout') }}"; class="dropdown-item d-block p-h-15 p-v-10">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <i class="anticon opacity-04 font-size-16 anticon-logout"></i>
                                        <span class="m-l-10">Logout</span>
                                    </div>
                                    <i class="anticon font-size-10 anticon-right"></i>
                                </div>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Header END -->

        <!-- Side Nav START -->
         @yield('sidebar')
        <!-- Side Nav END -->

        <!-- Page Container START -->
        <div class="page-container">


            <!-- Content Wrapper START -->
            <div class="main-content">
                @yield('content')
            </div>
            <!-- Content Wrapper END -->

            <!-- Footer START -->
            <footer class="footer">
                <div class="footer-content">
                    <p class="m-b-0">Copyright © 2019 Sistem informasi Pelaporan</p>
                    <span>
                            <a  class="text-gray m-r-15">Term &amp; Conditions</a>
                            <a  class="text-gray">Privacy &amp; Policy</a>
                        </span>
                </div>
            </footer>
            <!-- Footer END -->

        </div>
    </div>
</div>


<!-- Core Vendors JS -->
<script src="assets/js/vendors.min.js"></script>

<!-- page js -->

<!-- Core JS -->
<script src="assets/js/app.min.js"></script>

<!-- page js -->
<script src="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script>
    $('.datepicker-input').datepicker({
        format: 'yyyy/mm/dd'
    });


</script>

@yield('js')
</body>


<!-- Mirrored from themenate.com/enlink-bs/dist/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 03 Jan 2020 04:39:21 GMT -->
</html>
