@section('sidebar')


<div class="side-nav">
    <div class="side-nav-inner">
        <ul class="side-nav-menu scrollable">
    @if(Auth::user()->role_id == 1)
           <li class="nav-item dropdown open">
                    <a class="dropdown-toggle" href="{{ url('kelolauser') }}">
                                <span class="icon-holder">
                                    <i class="anticon anticon-user-add" ></i>
                                </span>
                        <span class="title">Kelola User</span>
                    </a>
                </li>

    @else


    @endif

        </ul>
    </div>
</div>
@endsection
