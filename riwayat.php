<?php
require_once "config.php";
if (session_status() === PHP_SESSION_NONE) session_start();
require_once "cek_session.php";
cek_login();

$nama = $_SESSION['name'];
$role = strtolower(trim($_SESSION['role']));
$guru_id = (int)($_SESSION['guru_id'] ?? 0);

function e($val) {
    return htmlspecialchars((string)$val, ENT_QUOTES, 'UTF-8');
}

if (!in_array($role, ['admin', 'wali_kelas', 'guru'])) {
    echo "<script>alert('Anda tidak berhak mengakses halaman ini!');location.href='dashboard.php';</script>";
    exit;
}

// === HAPUS DATA ===
if (isset($_GET['hapus']) && is_numeric($_GET['hapus'])) {
    $id_hapus = (int)$_GET['hapus'];
    $boleh_hapus = false;

    // Hanya boleh hapus yang DIA catat
    $cek = mysqli_query($conn, "
        SELECT 1 FROM t_pelanggaran_siswa 
        WHERE id = $id_hapus AND guru_id = $guru_id LIMIT 1
    ");
    $boleh_hapus = mysqli_num_rows($cek) > 0;

    if (!$boleh_hapus) {
        echo "<script>alert('Anda hanya boleh menghapus catatan yang Anda buat sendiri!');location.href='riwayat.php';</script>";
        exit;
    }

    mysqli_query($conn, "DELETE FROM t_pelanggaran_siswa WHERE id = $id_hapus");
    echo "<script>alert('Data berhasil dihapus!');location.href='riwayat.php';</script>";
    exit;
}

// === QUERY DATA — DIPERBAIKI ===
if ($role === 'admin') {
    // ✅ ADMIN: Lihat SEMUA riwayat
    $sql = "
        SELECT p.id, s.nis, s.nama AS nama_siswa,
               kels.nama AS nama_kelas_siswa,
               k.nama AS kategori, p.poin, p.tindakan, p.created_at AS tanggal,
               g.nama AS dicatat_oleh, p.tindakan_selesai
        FROM t_pelanggaran_siswa p
        LEFT JOIN t_siswa s ON p.siswa_id = s.id
        LEFT JOIN t_kelas_siswa ks ON s.id = ks.siswa_id
        LEFT JOIN t_kelas kels ON ks.kelas_id = kels.id
        LEFT JOIN t_pelanggaran_kategori k ON p.kategori_id = k.id
        LEFT JOIN t_guru g ON p.guru_id = g.id
        ORDER BY p.created_at DESC, p.id DESC
    ";
    $info_halaman = "<strong>Peran:</strong> Administrator — Menampilkan semua riwayat pelanggaran";
} else {
    // ✅ GURU & WALI KELAS: HANYA lihat yang DIA CATAT SENDIRI
    $sql = "
        SELECT p.id, s.nis, s.nama AS nama_siswa,
               kels.nama AS nama_kelas_siswa,
               k.nama AS kategori, p.poin, p.tindakan, p.created_at AS tanggal,
               g.nama AS dicatat_oleh, p.tindakan_selesai
        FROM t_pelanggaran_siswa p
        LEFT JOIN t_siswa s ON p.siswa_id = s.id
        LEFT JOIN t_kelas_siswa ks ON s.id = ks.siswa_id
        LEFT JOIN t_kelas kels ON ks.kelas_id = kels.id
        LEFT JOIN t_pelanggaran_kategori k ON p.kategori_id = k.id
        LEFT JOIN t_guru g ON p.guru_id = g.id
        WHERE p.guru_id = $guru_id
        ORDER BY p.created_at DESC, p.id DESC
    ";
    $info_halaman = "<strong>Peran:</strong> " . ucfirst($role) . " — Menampilkan hanya pelanggaran yang <strong>Anda catat sendiri</strong>";
}

$daftar_riwayat = [];
$result = mysqli_query($conn, $sql);
while ($row = mysqli_fetch_assoc($result)) {
    $daftar_riwayat[] = $row;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Riwayat Pelanggaran - SMK Muhammadiyah Kota Tasikmalaya</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <?php include "menu.php"; ?>
        <main class="col-md-9 col-lg-10 p-4">
            <h2 class="mb-3">Riwayat Pelanggaran</h2>
            <p>Selamat datang, <strong><?= e($nama) ?></strong>!</p>

            <div class="alert alert-info mb-4">
                <?= $info_halaman ?>
            </div>

            <?php if (empty($daftar_riwayat)): ?>
                <div class="alert alert-warning">
                    Belum ada riwayat pelanggaran yang Anda catat.
                    <a href="catat_pelanggaran.php" class="alert-link d-block mt-2">→ Catat pelanggaran baru</a>
                </div>
            <?php else: ?>
                <div class="card shadow-sm">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover mb-0">
                                <thead class="table-dark">
                                    <tr>
                                        <th width="5%" class="text-center">No</th>
                                        <th width="12%">Tanggal</th>
                                        <th width="8%">NIS</th>
                                        <th width="15%">Nama Siswa</th>
                                        <th width="10%">Kelas</th>
                                        <th width="14%">Kategori</th>
                                        <th width="7%" class="text-center">Poin</th>
                                        <th width="10%">Status</th>
                                        <th width="14%">Dicatat Oleh</th>
                                        <th>Keterangan/Tindakan</th>
                                        <th width="8%" class="text-center">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $no = 1; foreach ($daftar_riwayat as $r):
                                        $poin = (int)$r['poin'];
                                        $baris = $poin >= 10 ? 'table-danger' : ($poin >= 5 ? 'table-warning' : 'table-light');
                                        $tgl = date('d/m/Y H:i', strtotime($r['tanggal']));
                                        
                                        $tindakan_terisi = !empty(trim((string)($r['tindakan'] ?? '')));
                                        $label_status = $tindakan_terisi ? 'SELESAI' : 'PERLU TINDAKAN';
                                        $warna_status = $tindakan_terisi ? 'bg-success' : 'bg-warning text-dark';
                                    ?>
                                    <tr class="<?= $baris ?>">
                                        <td class="text-center"><?= $no++ ?></td>
                                        <td><?= $tgl ?></td>
                                        <td><?= e($r['nis']) ?></td>
                                        <td><?= e($r['nama_siswa']) ?></td>
                                        <td><?= e($r['nama_kelas_siswa'] ?? '-') ?></td>
                                        <td><?= e($r['kategori'] ?? '-') ?></td>
                                        <td class="text-center fw-bold text-danger"><?= $poin ?></td>
                                        <td class="text-center">
                                            <span class="badge <?= $warna_status ?>"><?= $label_status ?></span>
                                        </td>
                                        <td><small><?= e($r['dicatat_oleh'] ?? '-') ?></small></td>
                                        <td><small><?= e($r['tindakan'] ?? '-') ?></small></td>
                                        <td class="text-center">
                                            <a href="riwayat.php?hapus=<?= $r['id'] ?>"
                                               class="btn btn-sm btn-danger"
                                               onclick="return confirm('Yakin hapus?')">
                                                Hapus
                                            </a>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="mt-3">
                    <a href="rekap_poin.php" class="btn btn-secondary">Lihat Laporan Rekap</a>
                </div>
            <?php endif; ?>
        </main>
    </div>
</div>
<?php file_exists("footer.php") && include "footer.php"; ?>
</body>
</html>