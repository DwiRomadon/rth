<?php
// memanggil library FPDF
require('../fpdf/fpdf.php');
require ('../function/koneksi.php');

$kodeklausal = $_POST['kodeklausal'];
$namaklausal = $_POST['namaklausal'];
$point = $_POST['point'];
$keterangan = $_POST['keterangan'];

$klausal    = mysqli_query($con,"select * from t_klausal where kode_klausal='$kodeklausal'");
$penjelasan = mysqli_fetch_array($klausal);

// intance object dan memberikan pengaturan halaman PDF
$pdf = new FPDF('P','mm','A4');
// membuat halaman baru
$pdf->AddPage();
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','',12);
// mencetak string
// mencetak string
$pdf->SetFont('Arial','B',12);
$pdf->Cell(190,7,'Klausal '.$namaklausal,0,1,'C');

// Memberikan space kebawah agar tidak terlalu rapat
$pdf->Cell(10,7,'',0,1);

$pdf->Cell(80,7,'Kode = '.$kodeklausal,0,1);
$pdf->SetFont('Arial','B',10);
$pdf->Cell(80,6,'Nama Klausal',1,0);
$pdf->Cell(30,6,'Point',1,0);
$pdf->Cell(80,6,'Keterangan',1,1);

$pdf->SetFont('Arial','',10);
//
//
$pdf->Cell(80,6,$namaklausal,1,0);
$pdf->Cell(30,6,$point,1,0);
$pdf->Cell(80,6,$keterangan,1,1);

$pdf->Cell(80,6,"",0,2);
$pdf->SetFont('Arial','B',12);
$pdf->Cell(190,7,"Penjelasan",0,3, 'C');
$pdf->Cell(80,6,"",0,4);
$pdf->SetFont('Arial','',10);
$str_text = str_replace("\n","<br>",$penjelasan['penjelasan']);
//$pdf->Cell(190,6,,0,5, 'C');
$pdf->MultiCell(190, 6,$str_text, 0, 'J', 0, 1, '', '', true, null, true);

$pdf->Cell(80,6,"",0,2);
$pdf->SetFont('Arial','B',12);
if($point <= 4){
    $pdf->Cell(190,7,"Rekomendasi",0,3, 'C');
    $str_text_rekomendasi = str_replace("\n","<br>",$penjelasan['rekomendasi']);
    $pdf->SetFont('Arial','',10);
    $pdf->MultiCell(190, 6,$str_text_rekomendasi, 0, 'J', 0, 1, '', '', true, null, true);
}
$pdf->Output();
?>

