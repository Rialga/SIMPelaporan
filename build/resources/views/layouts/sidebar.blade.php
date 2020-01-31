@section('sidebar')


<div class="side-nav">
    <div class="side-nav-inner">
        <ul class="side-nav-menu scrollable">

            @if(Auth::user()->role_id == 1)
                <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('home') }}">
                                    <span class="icon-holder">
                                        <i class="fas fa-home"></i>
                                    </span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('kelolauser') }}">
                                    <span class="icon-holder">
                                        <i class="anticon anticon-user-add" ></i>
                                    </span>
                        <span class="title">Kelola User</span>
                    </a>
                </li>
                <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('kelolapelapor') }}">
                                <span class="icon-holder">
                                    <i class="anticon anticon-team"></i>
                                </span>
                        <span class="title">Data Pelapor</span>
                    </a>
                </li>

                <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('kelolalaporan') }}">
                                <span class="icon-holder">
                                    <i class="anticon anticon-file"></i>
                                </span>
                        <span class="title">Laporan</span>
                    </a>
                </li>

                <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('downloadlaporan') }}">
                                <span class="icon-holder">
                                    <i class="anticon anticon-file"></i>
                                </span>
                        <span class="title">Laporan II</span>
                    </a>
                </li>

                <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('kelolalaporan/excel') }}">
                                <span class="icon-holder">
                                    <i class="anticon anticon-file"></i>
                                </span>
                        <span class="title">Laporan III</span>
                    </a>
                </li>

           @else
                <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('kelolapelapor') }}">
                                <span class="icon-holder">
                                    <i class="anticon anticon-team"></i>
                                </span>
                        <span class="title">Data Pelapor</span>
                    </a>
                </li>
                <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('kelolalaporan') }}">
                                <span class="icon-holder">
                                    <i class="anticon anticon-team"></i>
                                </span>
                        <span class="title">Laporan</span>
                    </a>
                </li>
           @endif

        </ul>
    </div>
</div>
@endsection
