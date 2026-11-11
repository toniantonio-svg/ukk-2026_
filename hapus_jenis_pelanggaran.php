<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once "config.php";
require_once "cek_session.php";
cek_admin();

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id = (int)$_GET['id'];

    try {
        // ✅ TIDAK PERLU hapus dari t_pelanggaran_siswa karena jenis bukan foreign key
        $stmt = $conn->prepare("DELETE FROM t_pelanggaran WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            $pesan = "Jenis pelanggaran berhasil dihapus!";
            header("Location: kelola_jenis_pelanggaran.php?berhasil=1&pesan=" . urlencode($pesan));
        } else {
            $pesan = "Jenis pelanggaran tidak ditemukan!";
            header("Location: kelola_jenis_pelanggaran.php?gagal=1&pesan=" . urlencode($pesan));
        }
        exit;

    } catch (Throwable $e) {
        $pesan = "Gagal: " . $e->getMessage();
        header("Location: kelola_jenis_pelanggaran.php?gagal=1&pesan=" . urlencode($pesan));
        exit;
    }
}

header("Location: kelola_jenis_pelanggaran.php");
exit;
?>