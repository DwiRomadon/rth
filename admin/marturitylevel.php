<?php
require_once("../function/koneksi.php");
session_start();

if(isset($_SESSION['username']) && $_SESSION['level'] == '1'){

    $username = $_SESSION['username'];
    $name = $_SESSION['name'];
    $email = $_SESSION['email'];
}else{
    echo "<script>alert('Anda tidak diizinkan mengakses halaman ini'); window.location=('http://localhost/ratih/');</script>";
}
$klausal      = mysqli_query($con,"select * from t_klausal");
$keamanan     = mysqli_query($con,"select * from t_keamanan");
$tujuan       = mysqli_query($con,"select * from t_tujuan");
$totResponden = mysqli_query($con,"select count(kode_user) as total from totalresponden");
?>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Aplikasi Ratih</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="../images/favicon.png">
    <link rel="shortcut icon" href="../images/favicon.png">

    <link rel="stylesheet" href="../assets/css/normalize.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="../assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="../assets/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/lib/chosen/chosen.min.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <?php require_once "../views/style.php"?>
</head>
<body>

<?php require_once "../views/sidebar.php" ?>

<div id="right-panel" class="right-panel">

    <?php require_once "../views/header.php" ?>

    <div class="breadcrumbs">
        <div class="breadcrumbs-inner">
            <div class="row m-0">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1> Maturity Level</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">Master Data</a></li>
                                <li class="active"> Maturity Level</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
<!--        <div class="animated fadeIn">-->
<!--            <div class="row">-->
<!--                <div class="col-xs-12 col-sm-12">-->
<!--                    <div class="card">-->
<!--                        <div class="card-header">-->
<!--                            <strong class="card-title">Tampilkan Berdasarkan</strong>-->
<!--                        </div>-->
<!--                        <form action="marturitylevel.php" method="post">-->
<!--                            <div class="card-body">-->
<!--                                <table id="bootstrap-data-table" class="table table-striped table-bordered">-->
<!--                                    <tr>-->
<!--                                        <td>-->
<!--                                            <select name="kodeklausal" data-placeholder="Pilih Klausal..." class="standardSelect" tabindex="1">-->
<!--                                                <option>--Pilih Kode Klausal--</option>-->
<!--                                                <option value="" label="default"></option>-->
<!--                                                --><?php //foreach ($klausal as $data){ ?>
<!--                                                    <option value="--><?php //echo $data['kode_klausal'];?><!--">--><?php //echo $data['kode_klausal']." - ".$data['klausal'];?><!--</option>-->
<!--                                                --><?php //}?>
<!--                                            </select>-->
<!--                                        </td>-->
<!--                                    </tr>-->
<!--                                    <tr>-->
<!--                                        <td>-->
<!--                                            <select name="kodekeamanan" data-placeholder="Pilih Objektif Kontrol..." class="standardSelect" tabindex="1">-->
<!--                                                <option>--Pilih Kode Klausal--</option>-->
<!--                                                <option value="" label="default"></option>-->
<!--                                                --><?php //foreach ($keamanan as $data1){ ?>
<!--                                                    <option value="--><?php //echo $data1['kode_keamanan'];?><!--">--><?php //echo $data1['kode_keamanan']." - ".$data1['keamanan'];?><!--</option>-->
<!--                                                --><?php //}?>
<!--                                            </select>-->
<!--                                        </td>-->
<!--                                    </tr>-->
<!--                                </table>-->
<!--                                <div class="text-right">-->
<!--                                    <hr>-->
<!--                                    <button type="submit" name="submit" class="btn btn-primary btn-sm">-->
<!--                                        <i class="fa fa-dot-circle-o"></i> Submit-->
<!--                                    </button>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </form>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->


        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Hasil</strong> Maturity Level
                            </div>
                            <canvas id="speedChart" width="600" height="400"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <p>
            <i class="fa fa-user"></i>
            Total Responden <?php
            $tot = mysqli_fetch_array($totResponden);
            echo $tot['total'];
            ?>
        </p>

        <div class="clearfix"></div>

        <?php require_once "../views/footer.php" ?>

    </div>

    <script>
        jQuery(document).ready(function() {
            jQuery(".standardSelect").chosen({
                disable_search_threshold: 10,
                no_results_text: "Oops, nothing found!",
                width: "100%"
            });
        });
    </script>

</body>
</html>
<script>
    //bar
    var speedCanvas = document.getElementById("speedChart");

    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 18;
    <?php
        $totalPoint   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.5'");
        $row = mysqli_fetch_array($totalPoint);
        $data = $row['points'];

        $totalPoint1   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.6'");
        $row1 = mysqli_fetch_array($totalPoint1);
        $data1 = $row1['points'];

        $totalPoint2   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.7'");
        $row2 = mysqli_fetch_array($totalPoint2);
        $data2 = $row2['points'];

        $totalPoint3   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.8'");
        $row3 = mysqli_fetch_array($totalPoint3);
        $data3 = $row3['points'];

        $totalPoint4   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.9'");
        $row4 = mysqli_fetch_array($totalPoint4);
        $data4 = $row4['points'];

        $totalPoint5   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.10'");
        $row5 = mysqli_fetch_array($totalPoint5);
        $data5 = $row5['points'];

        $totalPoint6   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.11'");
        $row6 = mysqli_fetch_array($totalPoint6);
        $data6 = $row6['points'];

        $totalPoint7   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.12'");
        $row7 = mysqli_fetch_array($totalPoint7);
        $data7 = $row7['points'];

        $totalPoint8   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.13'");
        $row8 = mysqli_fetch_array($totalPoint8);
        $data8 = $row8['points'];

        $totalPoint9   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.14'");
        $row9 = mysqli_fetch_array($totalPoint9);
        $data9 = $row9['points'];

        $totalPoint10   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.15'");
        $row10 = mysqli_fetch_array($totalPoint10);
        $data10 = $row10['points'];

        $totalPoint11   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.16'");
        $row11 = mysqli_fetch_array($totalPoint11);
        $data11 = $row11['points'];

        $totalPoint12   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.17'");
        $row12 = mysqli_fetch_array($totalPoint12);
        $data12 = $row12['points'];

        $totalPoint13   = mysqli_query($con,"SELECT SUM(`point`) as points FROM `t_hasil_quisioner` WHERE `kode_klausal`='A.18'");
        $row13 = mysqli_fetch_array($totalPoint13);
        $data13 = $row13['points'];


    ?>
    var speedData = {
        labels: ["A.5", "A.6", "A.7", "A.8", "A.9", "A.10", "A.11", "A.12", "A.13", "A.14", "A.15", "A.16", "A.17", "A.18"],
        datasets: [{
            label: "Point dari jawaban user perklausal",
            data: [<?php echo $data;?>, <?php echo $data1;?>, <?php echo $data2;?>, <?php echo $data3;?>, <?php echo $data4;?>, <?php echo $data5;?>, <?php echo $data6;?>,
                <?php echo $data7;?>, <?php echo $data8;?>, <?php echo $data9;?>, <?php echo $data10;?>, <?php echo $data11;?>, <?php echo $data12;?>,
                <?php echo $data13;?>
            ],
            lineTension: 0,
            fill: false,
            borderColor: 'orange',
            backgroundColor: 'transparent',
            borderDash: [5, 5],
            pointBorderColor: 'orange',
            pointBackgroundColor: 'rgba(255,150,0,0.5)',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            pointStyle: 'rectRounded'
        }]
    };

    var chartOptions = {
        legend: {
            display: true,
            position: 'top',
            labels: {
                boxWidth: 50,
                fontColor: 'black'
            }
        }
    };

    var lineChart = new Chart(speedCanvas, {
        type: 'line',
        data: speedData,
        options: chartOptions
    });

</script>
