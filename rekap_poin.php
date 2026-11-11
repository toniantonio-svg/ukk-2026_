<?php
require_once "config.php";
if (session_status() === PHP_SESSION_NONE) session_start();
require_once "cek_session.php";
cek_login();

function e($v) {
    return htmlspecialchars((string)($v ?? ''), ENT_QUOTES, 'UTF-8');
}

$nama = $_SESSION['name'];
$role = strtolower(trim($_SESSION['role'] ?? ''));
$wali_kelas_id = (int)($_SESSION['wali_kelas_id'] ?? 0);

// Filter kelas
$filter_where = "";
$params = [];
$types = "";

if ($role === 'wali_kelas' && $wali_kelas_id > 0) {
    $sk = $conn->prepare("SELECT id, nama FROM t_kelas WHERE wali_kelas_id = ? AND status_aktif = 1");
    $sk->bind_param("i", $wali_kelas_id);
    $sk->execute();
    $kelas_wali = $sk->get_result()->fetch_assoc();
    
    if ($kelas_wali) {
        $filter_where = "AND ks.kelas_id = ? ";
        $params[] = $kelas_wali['id'];
        $types .= "i";
        $info_kelas = "Kelas: " . e($kelas_wali['nama']);
    }
} else {
    $info_kelas = "Semua Kelas";
}

// Ambil data rekap poin — PERBAIKAN: pastikan kolom tindakan terbaca benar
$sql = "SELECT 
            s.id, 
            s.nama, 
            s.nis, 
            k.nama AS nama_kelas,
            wali_g.nama AS nama_wali,
            COALESCE(SUM(ps.poin), 0) AS total_poin,
            '' AS daftar_tindakan,
            '' AS daftar_pencatat
        FROM t_siswa s
        INNER JOIN t_kelas_siswa ks ON s.id = ks.siswa_id
        INNER JOIN t_kelas k ON ks.kelas_id = k.id
        LEFT JOIN t_wali_kelas wk ON k.id = wk.kelas_id AND wk.status_aktif = 1
        LEFT JOIN t_guru wali_g ON wk.guru_id = wali_g.id
        LEFT JOIN t_pelanggaran_siswa ps ON s.id = ps.siswa_id
        WHERE s.status_aktif = 1 $filter_where
        GROUP BY s.id, ks.kelas_id
        ORDER BY k.nama, s.nama";

$stmt = $conn->prepare($sql);
if (!empty($params)) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$result = $stmt->get_result();
$daftar_siswa = [];
while ($r = $result->fetch_assoc()) {
    // Ambil tindakan dan pencatat secara terpisah
    $sql_detail = "SELECT ps.tindakan, g.nama AS nama_guru, DATE_FORMAT(ps.created_at, '%d/%m/%Y') AS tgl
                   FROM t_pelanggaran_siswa ps
                   LEFT JOIN t_guru g ON ps.guru_id = g.id
                   WHERE ps.siswa_id = ? AND ps.tindakan IS NOT NULL AND ps.tindakan != ''
                   ORDER BY ps.created_at DESC";
    $stmt_detail = $conn->prepare($sql_detail);
    $stmt_detail->bind_param("i", $r['id']);
    $stmt_detail->execute();
    $res_detail = $stmt_detail->get_result();
    
    $tindakan_list = [];
    $pencatat_list = [];
    while ($d = $res_detail->fetch_assoc()) {
        $tindakan_list[] = $d['tindakan'];
        $pencatat_list[] = $d['nama_guru'] . ' (' . $d['tgl'] . ')';
    }
    $r['daftar_tindakan'] = implode(' | ', $tindakan_list);
    $r['daftar_pencatat'] = implode(' | ', $pencatat_list);
    $daftar_siswa[] = $r;
}

$semua_tertib = true;
foreach ($daftar_siswa as $s) {
    if ($s['total_poin'] > 0) { $semua_tertib = false; break; }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Rekap Poin Pelanggaran - SMK Muhammadiyah Kota Tasikmalaya</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <?php include "menu.php"; ?>
        <main class="col-md-9 col-lg-10 p-4">
            <h2 class="mb-3">Daftar Siswa & Tindakan</h2>
            
            <div class="alert alert-info mb-4">
                <strong>Peran:</strong> <?= e(ucwords(str_replace('_', ' ', $role))) ?> | 
                <strong><?= e($info_kelas) ?></strong>
            </div>

            <div class="mb-3">
                <input type="text" id="cari" class="form-control" placeholder="Cari NIS, Nama, atau Tindakan...">
            </div>

            <?php if ($semua_tertib): ?>
                <div class="alert alert-success">
                    ✅ Semua siswa dalam keadaan tertib.
                </div>
            <?php endif; ?>

            <?php if (!empty($daftar_siswa)): ?>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered" id="tabelSiswa">
                        <thead class="table-dark">
                            <tr>
                                <th width="4%" class="text-center">No</th>
                                <th width="9%">NIS</th>
                                <th width="13%">Nama Siswa</th>
                                <th width="8%">Kelas</th>
                                <th width="13%">Wali Kelas</th>
                                <th width="6%" class="text-center">Poin</th>
                                <th width="24%" class="text-center">Tindakan</th>
                                <th width="24%" class="text-center">Pencatat & Tanggal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1; foreach ($daftar_siswa as $r): ?>
                            <tr class="<?= $r['total_poin'] > 0 ? 'table-warning' : '' ?>">
                                <td class="text-center"><?= $no++ ?></td>
                                <td><?= e($r['nis']) ?></td>
                                <td><?= e($r['nama']) ?></td>
                                <td><?= e($r['nama_kelas']) ?></td>
                                <td><?= e($r['nama_wali'] ?? '-') ?></td>
                                <td class="text-center">
                                    <?php if ($r['total_poin'] > 0): ?>
                                        <span class="badge bg-danger fs-6"><?= $r['total_poin'] ?></span>
                                    <?php else: ?>
                                        <span class="text-success">0</span>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <?php if ($r['total_poin'] == 0): ?>
                                        <span class="badge bg-success">Tertib</span>
                                    <?php elseif (!empty($r['daftar_tindakan'])): ?>
                                        <?= e($r['daftar_tindakan']) ?>
                                    <?php else: ?>
                                        <span class="badge bg-secondary">Belum Ada</span>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <?php if ($r['total_poin'] == 0): ?>
                                        —
                                    <?php elseif (!empty($r['daftar_pencatat'])): ?>
                                        <?= e($r['daftar_pencatat']) ?>
                                    <?php else: ?>
                                        <span class="text-muted">—</span>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php else: ?>
                <div class="alert alert-warning">Data siswa tidak ditemukan!</div>
            <?php endif; ?>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.getElementById('cari').addEventListener('input', function() {
    const k = this.value.toLowerCase();
    const rows = document.querySelectorAll('#tabelSiswa tbody tr');
    rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(k) ? '' : 'none';
    });
});
</script>
</body>
</html>