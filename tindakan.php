<?php
require_once "config.php";
if (session_status() === PHP_SESSION_NONE) session_start();
require_once "cek_session.php";
cek_login();

$nama = $_SESSION['name'];
$role = strtolower(trim($_SESSION['role'] ?? ''));
$guru_id = (int)($_SESSION['guru_id'] ?? 0);

function e($val) {
    return htmlspecialchars((string)$val, ENT_QUOTES, 'UTF-8');
}

if (!in_array($role, ['guru', 'wali_kelas', 'admin'])) {
    echo "<script>alert('Anda tidak berhak!');location.href='dashboard.php';</script>";
    exit;
}

// === PROSES SIMPAN TINDAKAN ===
$pesan = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['pelanggaran_siswa_id'])) {
    $ps_id = (int)$_POST['pelanggaran_siswa_id'];
    $tindakan_baru = trim($_POST['tindakan'] ?? '');

    if (empty($tindakan_baru)) {
        $pesan = '<div class="alert alert-danger">Isi tindakan terlebih dahulu!</div>';
    } else {
        $s = $conn->prepare("UPDATE t_pelanggaran_siswa 
            SET tindakan = ?, 
                tindakan_selesai = 1, 
                pemberi_tindakan_id = ?,
                waktu_tindakan = NOW(),
                updated_at = NOW() 
            WHERE id = ?");
        $s->bind_param("sii", $tindakan_baru, $guru_id, $ps_id);
        
        if ($s->execute()) {
            $pesan = '<div class="alert alert-success">✅ Tindakan berhasil disimpan!</div>';
        } else {
            $pesan = '<div class="alert alert-danger">Gagal: ' . e($s->error) . '</div>';
        }
    }
}

// === AMBIL KELAS WALI KELAS (untuk info saja, TIDAK membatasi data) ===
$kelas_id = 0;
$nama_kelas = '';
if ($role === 'wali_kelas') {
    $q = mysqli_query($conn, "
        SELECT w.kelas_id, k.nama AS nama_kelas
        FROM t_wali_kelas w
        JOIN t_kelas k ON w.kelas_id = k.id
        JOIN t_guru g ON w.guru_id = g.id
        WHERE w.status_aktif = 1
          AND g.nama LIKE '%" . mysqli_real_escape_string($conn, $nama) . "%'
        LIMIT 1
    ");
    if ($r = mysqli_fetch_assoc($q)) {
        $kelas_id = (int)$r['kelas_id'];
        $nama_kelas = $r['nama_kelas'];
    }
}

// === AMBIL DATA SISWA ===
$where = "";
$having = "";

// ✅ Wali Kelas & Guru: tampilkan SEMUA siswa yang punya pelanggaran belum ditindak
if ($role === 'wali_kelas' || $role === 'guru') {
    $having = "HAVING jumlah_belum_tindak > 0";
}
// Admin: tampilkan semua siswa (termasuk yang sudah selesai)

$sql = "
    SELECT 
        s.id, s.nis, s.nama AS nama_siswa,
        k.nama AS nama_kelas,
        g.nama AS nama_wali,
        COALESCE(SUM(ps.poin), 0) AS total_poin,
        -- Cek apakah masih ada yang belum ditindak
        (SELECT COUNT(*) 
         FROM t_pelanggaran_siswa ps_check 
         WHERE ps_check.siswa_id = s.id 
           AND ps_check.tindakan_selesai = 0
           AND (ps_check.tindakan IS NULL OR ps_check.tindakan = '')) AS jumlah_belum_tindak,
        -- Ambil ID pelanggaran yang belum ditindak
        (SELECT ps3.id 
         FROM t_pelanggaran_siswa ps3
         WHERE ps3.siswa_id = s.id
           AND ps3.tindakan_selesai = 0
           AND (ps3.tindakan IS NULL OR ps3.tindakan = '')
         ORDER BY ps3.created_at DESC LIMIT 1) AS pelanggaran_belum_id,
        -- Ambil info tindakan terakhir + siapa yang memberi
        (SELECT CONCAT(ps4.tindakan, ' — ', pg.nama, ' (', DATE_FORMAT(ps4.waktu_tindakan, '%d/%m/%Y %H:%i'), ')')
         FROM t_pelanggaran_siswa ps4
         LEFT JOIN t_guru pg ON ps4.pemberi_tindakan_id = pg.id
         WHERE ps4.siswa_id = s.id
           AND ps4.tindakan_selesai = 1
           AND ps4.tindakan IS NOT NULL 
           AND ps4.tindakan != ''
         ORDER BY ps4.waktu_tindakan DESC, ps4.created_at DESC LIMIT 1) AS info_tindakan
    FROM t_siswa s
    LEFT JOIN t_kelas_siswa ks ON s.id = ks.siswa_id
    LEFT JOIN t_kelas k ON ks.kelas_id = k.id
    LEFT JOIN t_wali_kelas wk ON k.id = wk.kelas_id AND wk.status_aktif = 1
    LEFT JOIN t_guru g ON wk.guru_id = g.id
    LEFT JOIN t_pelanggaran_siswa ps ON s.id = ps.siswa_id
    $where
    GROUP BY s.id, k.nama, g.nama
    $having
    ORDER BY k.nama, s.nama
";

$result = mysqli_query($conn, $sql);
$daftar_siswa = [];
while ($row = mysqli_fetch_assoc($result)) {
    $daftar_siswa[] = $row;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tindakan Siswa - SMK Muhammadiyah Kota Tasikmalaya</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <?php include "menu.php"; ?>
        <main class="col-md-9 col-lg-10 p-4">
            <h2 class="mb-3">Tindakan Siswa</h2>
            <p>Selamat datang, <strong><?= e($nama) ?></strong>! <small class="text-muted">(Role: <?= e($role) ?>)</small></p>

            <?= $pesan ?>

            <?php if ($role === 'wali_kelas' && $nama_kelas): ?>
                <div class="alert alert-info mb-4">
                    Anda adalah Wali Kelas: <strong><?= e($nama_kelas) ?></strong>
                    <br><small>Menampilkan <strong>semua siswa</strong> dari semua kelas yang memiliki pelanggaran belum ditindaklanjuti</small>
                </div>
            <?php endif; ?>

            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="mb-3">Daftar Siswa & Tindakan</h5>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-bordered">
                            <thead class="table-dark">
                                <tr>
                                    <th width="5%" class="text-center">No</th>
                                    <th width="9%">NIS</th>
                                    <th width="16%">Nama Siswa</th>
                                    <th width="10%">Kelas</th>
                                    <th width="12%">Wali Kelas</th>
                                    <th width="6%" class="text-center">Poin</th>
                                    <th width="28%">Tindakan yang Diambil</th>
                                    <th width="14%" class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($daftar_siswa)): ?>
                                    <?php $no = 1; foreach ($daftar_siswa as $s): 
                                        $poin = (int)$s['total_poin'];
                                        $belum_tindak_id = (int)($s['pelanggaran_belum_id'] ?? 0);
                                        $ada_belum_tindak = ((int)$s['jumlah_belum_tindak'] > 0);
                                        $info_tindakan = trim((string)($s['info_tindakan'] ?? ''));
                                    ?>
                                    <tr>
                                        <td class="text-center"><?= $no++ ?></td>
                                        <td><?= e($s['nis']) ?></td>
                                        <td><?= e($s['nama_siswa']) ?></td>
                                        <td><?= e($s['nama_kelas'] ?? '-') ?></td>
                                        <td><?= e($s['nama_wali'] ?? '-') ?></td>
                                        <td class="text-center fw-bold">
                                            <?php if ($poin > 0): ?>
                                                <span class="badge bg-danger fs-6"><?= $poin ?></span>
                                            <?php else: ?>
                                                <span class="badge bg-secondary">0</span>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <?php if ($ada_belum_tindak): ?>
                                                <span class="badge bg-warning text-dark">Belum Ada Tindakan</span>
                                                <?php if (!empty($info_tindakan)): ?>
                                                    <br><small class="text-muted">Terakhir: <?= e($info_tindakan) ?></small>
                                                <?php endif; ?>
                                            <?php elseif (!empty($info_tindakan)): ?>
                                                <small><?= e($info_tindakan) ?></small>
                                            <?php else: ?>
                                                <span class="badge bg-success">Tertib</span>
                                            <?php endif; ?>
                                        </td>
                                        <td class="text-center">
                                            <?php if ($ada_belum_tindak && $belum_tindak_id > 0): ?>
                                                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" 
                                                        data-bs-target="#modalTindakan<?= $belum_tindak_id ?>">
                                                    Beri Tindakan
                                                </button>
                                                
                                                <div class="modal fade" id="modalTindakan<?= $belum_tindak_id ?>" 
                                                     tabindex="-1" aria-labelledby="modalLabel<?= $belum_tindak_id ?>" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <form method="post">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="modalLabel<?= $belum_tindak_id ?>">
                                                                        Beri Tindakan
                                                                    </h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Tutup"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <input type="hidden" name="pelanggaran_siswa_id" value="<?= $belum_tindak_id ?>">
                                                                    
                                                                    <div class="mb-3">
                                                                        <label class="form-label fw-bold">Nama Siswa</label>
                                                                        <input type="text" class="form-control" 
                                                                               value="<?= e($s['nama_siswa']) ?> — NIS: <?= e($s['nis']) ?> (<?= e($s['nama_kelas'] ?? '-') ?>)" readonly>
                                                                    </div>
                                                                    
                                                                    <div class="mb-3">
                                                                        <label class="form-label fw-bold">Tindakan yang Diambil <span class="text-danger">*</span></label>
                                                                        <textarea name="tindakan" class="form-control" rows="4" required
                                                                                  placeholder="Tuliskan tindakan yang telah diambil..."></textarea>
                                                                    </div>
                                                                    
                                                                    <div class="alert alert-info py-2">
                                                                        <small>Anda: <strong><?= e($nama) ?></strong> — yang mencatat tindakan ini</small>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                                    <button type="submit" class="btn btn-primary">Simpan Tindakan</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php else: ?>
                                                <span class="badge bg-success">SELESAI</span>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr>
                                        <td colspan="8" class="text-center text-muted py-4">
                                            ✅ Semua pelanggaran sudah ditindaklanjuti.
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<?php file_exists("footer.php") && include "footer.php"; ?>
</body>
</html>