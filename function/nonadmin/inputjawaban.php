<?php

session_start();

if(isset($_SESSION['username']) && $_SESSION['level'] == '2'){

    $username = $_SESSION['username'];
    $name = $_SESSION['name'];
    $email = $_SESSION['email'];
    $iduser   = $_SESSION['id'];

}else{
    echo "<script>alert('Anda tidak diizinkan mengakses halaman ini'); window.location=('http://localhost/ratih/');</script>";
}

require_once("../koneksi.php");

// Deklarasi variable
$kodeklausal      = $_POST['kodeklausal'];
$kodekeamanan     = $_POST['kodekeamanan'];
$kodetujuan       = $_POST['kodetujuan'];
$point1           = $_POST['point'];
$submit           = $_POST['submit'];

if(isset($submit)){

    $cekUsers = mysqli_query($con,"SELECT * FROM `t_hasil_quisioner` WHERE  kode_klausal='$kodeklausal' and kode_keamanan='$kodekeamanan' and kode_tujuan='$kodetujuan' and kode_user='$iduser'");

    if (mysqli_num_rows($cekUsers) > 0){
        $Message = urlencode("Test");
        header("location:http://".$_SERVER['HTTP_HOST'].'/ratih/user/kuisioner.php?msg='.$Message);
    }else{
        $datas = mysqli_query($con,"SELECT * FROM `t_kuisioner` WHERE 
                                    `kode_klausal`='$kodeklausal'");

        //foreach ($datas as $data){
            $ins = mysqli_query($con,"insert into t_hasil_quisioner(kode_klausal,kode_keamanan,kode_tujuan, point, kode_user) 
                                         values ('$kodeklausal','$kodekeamanan', '$kodetujuan', '$point1','$iduser')");
            if($ins){
                header("location:http://".$_SERVER['HTTP_HOST'].'/ratih/user/getkuisioner.php?kodeklausal='.$kodeklausal);
            }else {
                echo "<script>alert('Gagal, silahkan ulangi'); window.location=('http://localhost/ratih/user/kuisioner');</script>";
            }
       // }
    }
}