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
$klausal    = mysqli_query($con,"select * from t_klausal");
$keamanan   = mysqli_query($con,"select * from t_keamanan");
$tujuan     = mysqli_query($con,"select * from t_tujuan");
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
        <div class="animated fadeIn">
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Tampilkan Berdasarkan</strong>
                        </div>
                        <form action="marturitylevel.php" method="post">
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <tr>
                                        <td>
                                            <select name="kodeklausal" data-placeholder="Pilih Klausal..." class="standardSelect" tabindex="1">
                                                <option>--Pilih Kode Klausal--</option>
                                                <option value="" label="default"></option>
                                                <?php foreach ($klausal as $data){ ?>
                                                    <option value="<?php echo $data['kode_klausal'];?>"><?php echo $data['kode_klausal']." - ".$data['klausal'];?></option>
                                                <?php }?>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select name="kodekeamanan" data-placeholder="Pilih Objektif Kontrol..." class="standardSelect" tabindex="1">
                                                <option>--Pilih Kode Klausal--</option>
                                                <option value="" label="default"></option>
                                                <?php foreach ($keamanan as $data1){ ?>
                                                    <option value="<?php echo $data1['kode_keamanan'];?>"><?php echo $data1['kode_keamanan']." - ".$data1['keamanan'];?></option>
                                                <?php }?>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <div class="text-right">
                                    <hr>
                                    <button type="submit" name="submit" class="btn btn-primary btn-sm">
                                        <i class="fa fa-dot-circle-o"></i> Submit
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Hasil</strong> Maturity Level
                            </div>
                            <div class="card-body card-block">
                                <canvas id="barChart"></canvas>
                            </div>
                            <?php

                                $atributMaturityLevel = mysqli_query($con,"SELECT COUNT(DISTINCT(`kode_user`)) as totalresponden FROM `t_hasil_quisioner`");

                                $row = mysqli_fetch_array($atributMaturityLevel);
                                ?>
                                <p>
                                    <i class="fa fa-user"></i>
                                    Total Responden <?php echo $row['totalresponden']?>
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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

    <?php

    if(isset($_POST['kodeklausal']) && isset($_POST['kodekeamanan']))
    {
    $kodeklausal  = $_POST['kodeklausal'];
    $kodekeamanan = $_POST['kodekeamanan'];
    $atributMaturityLevel = mysqli_query($con,"SELECT (SUM(`point`) / COUNT(kode_klausal)) as maturitylevel 
                                                          FROM `t_hasil_quisioner` WHERE `kode_klausal`='$kodeklausal' and `kode_keamanan`='$kodekeamanan'");

    $row = mysqli_fetch_array($atributMaturityLevel);
    ?>

    var ctxB = document.getElementById("barChart").getContext('2d');
    var myBarChart = new Chart(ctxB, {
        type: 'bar',
        data: {
            labels: ["Maturity Level"],
            datasets: [{
                label: '# Data',
                data: [<?php echo $row["maturitylevel"] ?>],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    <?php }?>

</script>
