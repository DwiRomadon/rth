<?php
// memanggil library FPDF
require('../fpdf/fpdf.php');
$namaklausal = $_POST['namaklausal'];
$point = $_POST['point'];
$keterangan = $_POST['keterangan'];
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

$pdf->Output();
$pdf->Output();
?>

