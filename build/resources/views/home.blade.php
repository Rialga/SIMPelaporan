@extends('layouts.main')
@extends('layouts.sidebar')

@section('content')

    <div class="row">
        <div class="col-md-12 col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="m-b-0">Total Laporan Polisi Tahun 2020</h5>
                    <div class="m-v-30 text-center" style="height: 330px">
                        <div class="media align-items-center">
                            <div class="avatar avatar-icon avatar-lg avatar-red">
                                <i class="anticon anticon-profile"></i>
                            </div>
                            <div class="m-l-30">
                                <h1 class="m-b-0">{{$laporan}}</h1>
                                <p class="m-b-0 text-muted">Laporan</p>
                            </div>
                        </div>


                    </div>


                </div>
            </div>
        </div>

            <div class="col-md-12 col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5>Laporan Kehilangan Pada Tahun {{$now - 1}}</h5>
                            <div>

                            </div>
                        </div>
                        <div class="m-t-50" style="height: 330px">
                            <canvas class="chart" id="line-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

    </div>

    <div class="row">

            <div class="col-md-12 col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5>Jumlahb Laporan Kehilangan Berdasarkan Jenis Pada Tahun {{$now - 1}}</h5>
                            <div>

                            </div>
                        </div>
                        <div class="m-t-50" style="height: 330px">
                            <canvas class="chart" id="bar-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

    </div>


@endsection

@section('js')
    <script src="{{ asset ('assets/vendors/chartjs/Chart.min.js')}}"></script>
    <script type="text/javascript">
        var ctx = document.getElementById('line-chart').getContext('2d');
        var jan = {!! json_encode($jan) !!};
        var feb = {!! json_encode($feb) !!};
        var mar = {!! json_encode($mar) !!};
        var apr = {!! json_encode($apr) !!};
        var mei = {!! json_encode($mei) !!};
        var jun = {!! json_encode($jun) !!};
        var jul = {!! json_encode($jul) !!};
        var agu = {!! json_encode($agu) !!};
        var sep = {!! json_encode($sep) !!};
        var okt = {!! json_encode($okt) !!};
        var nov = {!! json_encode($nov) !!};
        var des = {!! json_encode($des) !!};
        var chart = new Chart(ctx, {

            type: 'line',
            // The data for our dataset
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'Agus', 'Sep', 'Okt', 'Nov', 'Des'],
                datasets: [{
                    label: 'Customer Data',
                    backgroundColor: 'rgba(44,14,179,0)',
                    borderColor: 'rgba(25,165,234,0.77)',
                    pointBackgroundColor: 'rgba(25,165,234,0)',
                    pointBorderColor: 'rgba(187,206,215,0.98)',
                    pointHoverBackgroundColor: 'rgba(35,160,234,0.94)',
                    pointHoverBorderColor: 'rgba(35,160,234,0)',
                    data: [
                        jan, feb, mar, apr, mei, jun, jul, agu, sep, okt, nov, des
                    ],
                }]
            },
            // Configuration options go here
            options: {
                legend: {
                    display: false
                },
            }
        });


        var bar = document.getElementById('bar-chart').getContext('2d');

        var barchart = new Chart(bar, {

            type: 'bar',
            // The data for our dataset
            data: {
                labels: [ 'SIM', 'STNK', 'KTP', 'ATM', 'BPKP', 'DLL', 'UwU', 'DLL'],
                datasets: [{
                    backgroundColor: 'rgba(31,82,165,0.99)',
                    borderWidth: 0,
                    data: [ 56, 55, 40, 37, 54, 76, 63, 62],
                }]
            },
            // Configuration options go here
            options: {
                scaleShowVerticalLines: false,
                responsive: true,
                legend: {
                    display: false
                },
                scales: {
                    xAxes: [{
                        categoryPercentage: 0.45,
                        barPercentage: 0.70,
                        display: true,
                        scaleLabel: {
                            display: false,
                            labelString: 'Month'
                        },
                        gridLines: false,
                        ticks: {
                            display: true,
                            beginAtZero: true,
                            fontSize: 13,
                            padding: 10
                        }
                    }],
                    yAxes: [{
                        categoryPercentage: 0.35,
                        barPercentage: 0.70,
                        display: true,
                        scaleLabel: {
                            display: false,
                            labelString: 'Value'
                        },
                        gridLines: {
                            drawBorder: false,
                            offsetGridLines: false,
                            drawTicks: false,
                            borderDash: [3, 4],
                            zeroLineWidth: 1,
                            zeroLineBorderDash: [3, 4]
                        },
                        ticks: {
                            max: 100,
                            stepSize: 20,
                            display: true,
                            beginAtZero: true,
                            fontSize: 13,
                            padding: 10
                        }
                    }]
                }
            }
        });

    </script>

@endsection
