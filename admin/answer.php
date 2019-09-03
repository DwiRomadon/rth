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
                            <h1>Atribut Maturity Level</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">Master Data</a></li>
                                <li class="active">Atribut Maturity Level</li>
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
                        <form action="answer.php" method="post">
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <tr>
                                    <td >
                                        <select name="kodeklausal" data-placeholder="Pilih Klausal..." class="standardSelect" tabindex="1">
                                            <option>--Pilih Kode Klausal--</option>
                                            <option value="" label="default"></option>
                                            <?php foreach ($klausal as $data){ ?>
                                            <option value="<?php echo $data['kode_klausal'].'/'.$data['klausal'];?>"><?php echo $data['kode_klausal']." - ".$data['klausal'];?></option>
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
                            <strong>Hasil</strong> Atribut Maturity Level
                        </div>
                        <div class="card-body card-block">
                            <canvas id="barChart"></canvas>
                        </div>
                        <?php

                        if(isset($_POST['kodeklausal']))
                        {
                            $str_arr = explode ("/", $_POST['kodeklausal']);
                            $kodeklausal          = $str_arr[0];
                            $namaklausal          = $str_arr[1];
                            $totalPoint           = mysqli_query($con,"SELECT SUM(point) as totpoint FROM `t_hasil_quisioner` where `kode_klausal`='$kodeklausal'");
                            $banyakPertanyaan     = mysqli_query($con,"SELECT COUNT(*) as jumlahPertanyaan FROM `t_kuisioner` WHERE `kode_klausal`='$kodeklausal'");
    //                        $atributMaturityLevel = mysqli_query($con,"SELECT COUNT(kode_tujuan) as totalresponden FROM `t_hasil_quisioner` WHERE
    //                                                                          `kode_klausal`='$kodeklausal' and `kode_keamanan`='$kodekeamanan' and
    //                                                                          `kode_tujuan`='$kodetujuan'");

                            $row = mysqli_fetch_array($totalPoint);
                            $row2= mysqli_fetch_array($banyakPertanyaan);
                            if(isset($row['totpoint'])!='' && isset($row2['jumlahPertanyaan'])!=''){
                                $hasil = $row['totpoint']/$row2['jumlahPertanyaan'];

                            ?>

                            <p>
                                <i class="fa fa-hand-pointer-o"></i>
                                <b>Nama Klausal :</b> <?php echo $namaklausal?>
                                <br>
                                <i class="fa fa-check"></i>
                                <b>Point :</b> <?php echo round($hasil, 2)?>
                                <br>
                                <i class="fa fa-level-up"></i>
                                <b>Level Kematangan :</b> <?php
                                    $keterangan = '';
                                    if($hasil >= 4.5 && $hasil <=5.00){
                                        echo $keterangan = "Optimised";
                                    }else if($hasil >= 3.5 && $hasil <=4.49){
                                        echo $keterangan = "Managed and Measurable";
                                    }else if($hasil >= 2.50 && $hasil <=3.49){
                                        echo $keterangan ="Defined Process";
                                    }else if($hasil >= 1.50 && $hasil <=2.49){
                                        echo $keterangan ="Repeatable But Intuitive";
                                    }else if($hasil >= 0.50 && $hasil <=1.49){
                                        echo $keterangan = "Initial / Ad hoc";
                                    }else if($hasil >= 0 && $hasil <=0.49){
                                        echo $keterangan ="Non-Exixtent";
                                    }
                            }
                                ?>
                            <br>
                            <br>
                            <form target="_blank" method="post" action="laporanpdf.php">
                            <input type="hidden" name="namaklausal" value="<?php echo $namaklausal?>">
                            <input type="hidden" name="point" value="<?php echo round($hasil, 2)?>">
                            <input type="hidden" name="keterangan" value="<?php echo $keterangan?>">
                            <button type="submit" name="submit" class="btn btn-primary btn-sm">
                                <i class="fa fa-file-pdf-o"></i> Cetak PDF
                            </button>
                            </form>
                            </p>
                            <?php }?>
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

    if(isset($_POST['kodeklausal']))
    {
        $str_arr = explode ("/", $_POST['kodeklausal']);
        $kodeklausal          = $str_arr[0];
        $namaklausal          = $str_arr[1];
        $totalPoint           = mysqli_query($con,"SELECT SUM(point) as totpoint FROM `t_hasil_quisioner` where `kode_klausal`='$kodeklausal'");
        $banyakPertanyaan     = mysqli_query($con,"SELECT COUNT(*) as jumlahPertanyaan FROM `t_kuisioner` WHERE `kode_klausal`='$kodeklausal'");
        //                        $atributMaturityLevel = mysqli_query($con,"SELECT COUNT(kode_tujuan) as totalresponden FROM `t_hasil_quisioner` WHERE
        //                                                                          `kode_klausal`='$kodeklausal' and `kode_keamanan`='$kodekeamanan' and
        //                                                                          `kode_tujuan`='$kodetujuan'");

        $row = mysqli_fetch_array($totalPoint);
        $row2= mysqli_fetch_array($banyakPertanyaan);
        if(isset($row['totpoint'])!='' && isset($row2['jumlahPertanyaan'])!=''){

            $hasil = $row['totpoint']/$row2['jumlahPertanyaan'];

        $keterangan = "haha";
        ?>

        var ctxB = document.getElementById("barChart").getContext('2d');
        var myBarChart = new Chart(ctxB, {
            type: 'bar',
            data: {
                labels: ["Atribut Maturity Level"],
                datasets: [{
                    label: '# Data',
                    data: [<?php echo round($hasil, 2) ?>],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)'
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

    <?php }}?>

</script>
