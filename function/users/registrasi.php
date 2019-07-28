<?php

require_once("../koneksi.php");

// Deklarasi variable
$name       = $_POST['name'];
$username   = $_POST['username'];
$password   = md5($_POST['password']);
$email      = $_POST['email'];
$jabatan    = $_POST['jabatan'];
$tgl        = date("Y-m-d H:i:s");
$submit     = $_POST['submit'];

if(isset($submit)){

    if(empty($username) or empty($password) or empty($name) or empty($email) or empty($jabatan)){

        echo "<script>alert('Form tidak boleh kosong!!! Silakan ulangi lagi'); window.location=('register.html') </script>";
    }else{
        $ins = mysqli_query($con,"insert into user_access(name,username,email,password,id_jabatan,level,created_at) 
                                                        values ('$name','$username', '$email', '$password', '$jabatan', '2', '$tgl')");
        if($ins){
            echo "<script>alert('Berhasil Registrasi'); window.location=('http://localhost/ratih/');</script>";
        }else {
            echo "<script>alert('Gagal'); window.location=('http://localhost/ratih/page-register');</script>";
        }
    }
}
