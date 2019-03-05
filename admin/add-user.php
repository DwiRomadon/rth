<?php
session_start();

if(isset($_SESSION['username']) && $_SESSION['level'] == '1'){

    $username = $_SESSION['username'];
    $name = $_SESSION['name'];
    $email = $_SESSION['email'];
}else{
    echo "<script>alert('Anda tidak diizinkan mengakses halaman ini'); window.location=('http://localhost/ratih/');</script>";
}
?>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
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
                                <h1>User</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li class="active">Data User</li>
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
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <strong>Data</strong> User
                            </div>
                            <div class="card-body card-block">
                                <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">Nama Lengkap</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="Text..." class="form-control"><small class="form-text text-muted">Ex : Jhon Adam</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">Username</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="Text..." class="form-control"><small class="form-text text-muted">Ex : jhonadam</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">Email</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="Text..." class="form-control"><small class="form-text text-muted">Ex : jhon@mail.com</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">Password</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="Text..." class="form-control"></div>
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            <i class="fa fa-dot-circle-o"></i> Submit
                                        </button>
                                        <button type="reset" class="btn btn-danger btn-sm">
                                            <i class="fa fa-ban"></i> Reset
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>                    
                    </div>

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <strong>Deskripsi</strong>
                            </div>
                            <div class="card-body card-block">
                                <p>#Deskripsi fungsi form</p>
                            </div>
                        </div>                    
                    </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>

    <?php require_once "../views/footer.php" ?>

</div>

</body>
</html>