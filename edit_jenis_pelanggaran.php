<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once "config.php";
require_once "cek_session.php";
cek_admin();

function e($value) {
    return htmlspecialchars((string)($value ?? '-'), ENT_QUOTES, 'UTF-8');
}

$id = (int)($_GET['id'] ?? 0);
if ($id <= 0) {
    echo "<script>alert('ID tidak valid!');location.href='kelola_jenis_pelanggaran.php';</script>";
    exit;
}

// ✅ BENAR: Ambil dari t_pelanggaran, BUKAN t_pelanggaran_kategori
$q = mysqli_query($conn, "SELECT * FROM t_pelanggaran WHERE id = " . $id . " LIMIT 1");
$data = mysqli_fetch_assoc($q);
if (!$data) {
    echo "<script>alert('Data tidak ditemukan!');location.href='kelola_jenis_pelanggaran.php';</script>";
    exit;
}

// Ambil daftar kategori untuk dipilih
$kategori = mysqli_query($conn, "SELECT * FROM t_pelanggaran_kategori WHERE status_aktif = 1 ORDER BY nama");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $pelanggaran_kategori_id = (int)($_POST['pelanggaran_kategori_id'] ?? 0);
    $kode = trim($_POST['kode'] ?? '');
    $nama_val = trim($_POST['nama'] ?? '');
    $poin_val = (int)($_POST['poin'] ?? 0);
    $deskripsi = trim($_POST['deskripsi'] ?? '');
    $aktif_val = (int)($_POST['status_aktif'] ?? 0);

    if ($pelanggaran_kategori_id < 1) {
        $error = "Silakan pilih Kategori Pelanggaran!";
    } elseif (!$kode) {
        $error = "Kode pelanggaran wajib diisi!";
    } elseif (!$nama_val) {
        $error = "Nama pelanggaran wajib diisi!";
    } elseif ($poin_val < 1) {
        $error = "Poin harus lebih dari 0!";
    } else {
        $update = mysqli_query($conn, "
            UPDATE t_pelanggaran SET
                pelanggaran_kategori_id = " . $pelanggaran_kategori_id . ",
                kode = '" . mysqli_real_escape_string($conn, $kode) . "',
                nama = '" . mysqli_real_escape_string($conn, $nama_val) . "',
                poin = " . $poin_val . ",
                deskripsi = '" . mysqli_real_escape_string($conn, $deskripsi) . "',
                status_aktif = " . $aktif_val . ",
                updated_at = CURRENT_TIMESTAMP
            WHERE id = " . $id . "
        ");

        if ($update) {
            echo "<script>alert('✅ Berhasil diubah!');location.href='kelola_jenis_pelanggaran.php';</script>";
            exit;
        } else {
            $error = "Gagal disimpan: " . mysqli_error($conn);
        }
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ubah Jenis Pelanggaran</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <?php include "menu.php"; ?>
        <main class="col-md-9 col-lg-10 p-4">
            <h3 class="mb-4">Ubah Jenis Pelanggaran</h3>

            <?php if (!empty($error)): ?>
                <div class="alert alert-danger"><?= e($error) ?></div>
            <?php endif; ?>

            <div class="card shadow-sm">
                <div class="card-body">
                    <form method="POST">
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Kategori</label>
                            <div class="col-sm-10">
                                <select name="pelanggaran_kategori_id" class="form-select" required>
                                    <option value="">-- Pilih Kategori --</option>
                                    <?php while ($kt = mysqli_fetch_assoc($kategori)): ?>
                                    <option value="<?= $kt['id'] ?>" 
                                        <?= ($data['pelanggaran_kategori_id'] ?? 0) == $kt['id'] ? 'selected' : '' ?>>
                                        <?= e($kt['nama']) ?>
                                    </option>
                                    <?php endwhile; ?>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Kode Pelanggaran</label>
                            <div class="col-sm-10">
                                <input type="text" name="kode" class="form-control" 
                                       value="<?= e($data['kode']) ?>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Nama Pelanggaran</label>
                            <div class="col-sm-10">
                                <input type="text" name="nama" class="form-control" 
                                       value="<?= e($data['nama']) ?>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Poin</label>
                            <div class="col-sm-10">
                                <input type="number" name="poin" class="form-control" 
                                       min="1" value="<?= e($data['poin'] ?? 0) ?>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Deskripsi</label>
                            <div class="col-sm-10">
                                <textarea name="deskripsi" class="form-control" rows="3"><?= e($data['deskripsi']) ?></textarea>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label class="col-sm-2 col-form-label">Status Aktif</label>
                            <div class="col-sm-10">
                                <select name="status_aktif" class="form-select">
                                    <option value="1" <?= ($data['status_aktif'] ?? 1) == 1 ? 'selected' : '' ?>>Aktif</option>
                                    <option value="0" <?= ($data['status_aktif'] ?? 1) == 0 ? 'selected' : '' ?>>Tidak Aktif</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                            <a href="kelola_jenis_pelanggaran.php" class="btn btn-secondary">Kembali</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>