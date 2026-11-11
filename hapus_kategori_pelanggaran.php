<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once "config.php";
require_once "cek_session.php";
cek_admin();

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id = (int)$_GET['id'];
    
    // ==============================================
    // LANGKAH 1: HAPUS DARI t_pelanggaran_siswa
    // ==============================================
    $q1 = mysqli_query($conn, "DELETE FROM t_pelanggaran_siswa WHERE pelanggaran_kategori_id = $id");
    if (!$q1) {
        $q1 = mysqli_query($conn, "DELETE FROM t_pelanggaran_siswa WHERE kategori_id = $id");
    }
    
    // ==============================================
    // LANGKAH 2: HAPUS DARI t_pelanggaran ← INI YANG DULU KURANG!
    // ==============================================
    $q2 = mysqli_query($conn, "DELETE FROM t_pelanggaran WHERE pelanggaran_kategori_id = $id");
    
    if (!$q2) {
        $pesan = "❌ Gagal hapus dari t_pelanggaran: " . mysqli_error($conn);
        header("Location: kelola_kategori_pelanggaran.php?gagal=1&pesan=" . urlencode($pesan));
        exit;
    }
    
    // ==============================================
    // LANGKAH 3: BARU HAPUS KATEGORINYA
    // ==============================================
    $q3 = mysqli_query($conn, "DELETE FROM t_pelanggaran_kategori WHERE id = $id");
    
    if ($q3) {
        $pesan = "✅ Kategori beserta semua data terkait berhasil DIHAPUS PERMANEN!";
        header("Location: kelola_kategori_pelanggaran.php?berhasil=1&pesan=" . urlencode($pesan));
    } else {
        $pesan = "❌ Gagal hapus kategori: " . mysqli_error($conn);
        header("Location: kelola_kategori_pelanggaran.php?gagal=1&pesan=" . urlencode($pesan));
    }
    exit;
}

header("Location: kelola_kategori_pelanggaran.php");
exit;
?>