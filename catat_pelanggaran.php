<?php
require_once "config.php";
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once "cek_session.php";
cek_login();

function e($v) {
    return htmlspecialchars((string)($v ?? ''), ENT_QUOTES, 'UTF-8');
}

$nama = $_SESSION['name'];
$role = strtolower(trim($_SESSION['role'] ?? ''));
$guru_id = (int)($_SESSION['guru_id'] ?? 0);

if (!in_array($role, ['guru', 'wali_kelas', 'admin'])) {
    echo "<script>alert('Anda tidak berhak!');location.href='dashboard.php';</script>";
    exit;
}

// Semua kelas aktif
$daftar_kelas = [];
$q = mysqli_query($conn, "SELECT id, nama FROM t_kelas WHERE status_aktif = 1 ORDER BY nama");
while ($r = mysqli_fetch_assoc($q)) {
    $daftar_kelas[] = $r;
}

// Semua siswa
$semua_siswa = [];
$q_s = mysqli_query($conn, "SELECT s.id, s.nama, s.nis, ks.kelas_id 
                            FROM t_siswa s 
                            INNER JOIN t_kelas_siswa ks ON s.id = ks.siswa_id 
                            ORDER BY ks.kelas_id, s.nama");
if ($q_s) {
    while ($r = mysqli_fetch_assoc($q_s)) {
        $semua_siswa[] = $r;
    }
}

// Ambil kategori pelanggaran
$daftar_k = [];
$q_k = mysqli_query($conn, "SELECT id, nama 
                            FROM t_pelanggaran_kategori 
                            WHERE status_aktif = 1 
                            ORDER BY nama");
if ($q_k) {
    while ($r = mysqli_fetch_assoc($q_k)) {
        $daftar_k[] = $r;
    }
}

// Ambil semua jenis pelanggaran
$daftar_jenis = [];
$q_j = mysqli_query($conn, "SELECT p.id, p.nama, p.pelanggaran_kategori_id, p.poin 
                            FROM t_pelanggaran p 
                            WHERE p.status_aktif = 1 
                            ORDER BY p.pelanggaran_kategori_id, p.nama");
if ($q_j) {
    while ($r = mysqli_fetch_assoc($q_j)) {
        $daftar_jenis[] = $r;
    }
}

// Proses simpan — ✅ HANYA JALAN SAAT FORM DIKIRIM
$pesan = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['siswa_id'])) {
    $sid = (int)$_POST['siswa_id'];
    $jenis_id = (int)($_POST['jenis_id'] ?? 0);
    $tindakan = trim($_POST['tindakan'] ?? '');
    $ket = trim($_POST['keterangan'] ?? '');

    if ($jenis_id <= 0) {
        $pesan = '<div class="alert alert-danger">Pilih jenis pelanggaran!</div>';
    } else {
        // Ambil data dari t_pelanggaran
        $s = $conn->prepare("SELECT nama, poin, pelanggaran_kategori_id 
                            FROM t_pelanggaran 
                            WHERE id = ? AND status_aktif = 1");
        $s->bind_param("i", $jenis_id);
        $s->execute();
        $p = $s->get_result()->fetch_assoc();
        
        if ($p) {
            $poin = (int)$p['poin'];
            $kategori_id = (int)$p['pelanggaran_kategori_id'];
            
            // ✅ LOGIKA: jika tindakan diisi = selesai, jika kosong = belum
            $tindakan_selesai = !empty($tindakan) ? 1 : 0;
            
            $s = $conn->prepare("INSERT INTO t_pelanggaran_siswa 
                (siswa_id, pelanggaran_id, kategori_id, poin, tindakan, keterangan, guru_id, tindakan_selesai) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $s->bind_param("iiiisssi", $sid, $jenis_id, $kategori_id, $poin, $tindakan, $ket, $guru_id, $tindakan_selesai);
            
            if ($s->execute()) {
                $pesan = '<div class="alert alert-success">✅ Berhasil disimpan! Tindakan: <strong>' . ($tindakan ?: 'Belum ada tindakan') . '</strong></div>';
            } else {
                $pesan = '<div class="alert alert-danger">Gagal simpan: ' . e($s->error) . '</div>';
            }
        } else {
            $pesan = '<div class="alert alert-danger">Jenis pelanggaran tidak ditemukan!</div>';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Catat Pelanggaran - SMK Muhammadiyah Kota Tasikmalaya</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .siswa-list {
            position: absolute;
            z-index: 100;
            width: 100%;
            max-height: 240px;
            overflow-y: auto;
            background: #fff;
            border: 1px solid #ced4da;
            border-top: none;
            border-radius: 0 0 .375rem .375rem;
            box-shadow: 0 4px 12px rgba(0,0,0,.15);
            display: none;
        }
        .siswa-item {
            padding: .5rem .75rem;
            cursor: pointer;
        }
        .siswa-item:hover {
            background: #e9ecef;
        }
        .input-wrapper { position: relative; }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <?php include "menu.php"; ?>
        <main class="col-md-9 col-lg-10 p-4">
            <h2 class="mb-3">Catat Pelanggaran Siswa</h2>
            <p>Selamat datang, <strong><?= e($nama) ?></strong>!</p>

            <?= $pesan ?>

            <form method="post" class="card shadow-sm p-4">
                <div class="mb-3">
                    <label class="form-label fw-bold">Pilih Kelas</label>
                    <select name="kelas_id" id="pilihKelas" class="form-select form-select-lg" required onchange="filterSiswaByKelas()">
                        <option value="">-- Pilih Kelas --</option>
                        <?php foreach ($daftar_kelas as $k): ?>
                        <option value="<?= $k['id'] ?>">
                            <?= e($k['nama']) ?>
                        </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Nama Siswa</label>
                    <div class="input-wrapper">
                        <input type="text" id="cariS" class="form-control" 
                               placeholder="Pilih kelas terlebih dahulu..." autocomplete="off" disabled>
                        <div id="daftarSiswa" class="siswa-list"></div>
                    </div>
                    <input type="hidden" name="siswa_id" id="siswa_id" required>
                    <div id="namaTerpilih" class="mt-2 small text-success" style="display:none">
                        Terpilih: <strong id="labelSiswa"></strong>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Kategori Pelanggaran</label>
                    <select id="kategoriSelect" class="form-select form-select-lg" onchange="tampilJenisPelanggaran()">
                        <option value="">-- Pilih Kategori --</option>
                        <?php foreach ($daftar_k as $k): ?>
                        <option value="<?= $k['id'] ?>">
                            <?= e($k['nama']) ?>
                        </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Jenis Pelanggaran</label>
                    <select name="jenis_id" id="jenisSelect" class="form-select form-select-lg" required>
                        <option value="">-- Pilih Kategori Dulu --</option>
                        <?php foreach ($daftar_jenis as $j): ?>
                        <option value="<?= $j['id'] ?>" data-kategori="<?= $j['pelanggaran_kategori_id'] ?>" data-poin="<?= $j['poin'] ?>">
                            <?= e($j['nama']) ?> (<?= $j['poin'] ?> poin)
                        </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Tindakan yang Diambil</label>
                    <textarea name="tindakan" class="form-control" rows="3" 
                              placeholder="Tuliskan tindakan yang telah diambil..."></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Keterangan Tambahan</label>
                    <textarea name="keterangan" class="form-control" rows="2" 
                              placeholder="Tulis jika ada..."></textarea>
                </div>

                <button type="submit" class="btn btn-primary btn-lg w-100">
                    Simpan Pelanggaran
                </button>
            </form>
        </main>
    </div>
</div>

<script>
    const semuaSiswa = <?= json_encode($semua_siswa) ?>;
    const semuaJenis = document.querySelectorAll('#jenisSelect option');
    
    const pilihKelasEl = document.getElementById('pilihKelas');
    const cariSEl = document.getElementById('cariS');
    const daftarSiswaEl = document.getElementById('daftarSiswa');
    const siswaIdEl = document.getElementById('siswa_id');
    const namaTerpilihEl = document.getElementById('namaTerpilih');
    const labelSiswaEl = document.getElementById('labelSiswa');
    const kategoriSelectEl = document.getElementById('kategoriSelect');
    const jenisSelectEl = document.getElementById('jenisSelect');
    
    let terpilih = null;
    let siswaTerpilihKelas = [];

    function filterSiswaByKelas() {
        const kelasId = parseInt(pilihKelasEl.value);
        siswaIdEl.value = '';
        cariSEl.value = '';
        cariSEl.disabled = !kelasId;
        namaTerpilihEl.style.display = 'none';
        terpilih = null;
        daftarSiswaEl.style.display = 'none';
        
        if (!kelasId) {
            siswaTerpilihKelas = [];
            return;
        }
        
        siswaTerpilihKelas = semuaSiswa.filter(s => parseInt(s.kelas_id) === kelasId);
    }

    function render(daftar) {
        daftarSiswaEl.innerHTML = '';
        if (!daftar.length) {
            daftarSiswaEl.innerHTML = '<div class="p-2 text-muted">Tidak ada siswa di kelas ini</div>';
            daftarSiswaEl.style.display = 'block';
            return;
        }
        daftar.forEach(s => {
            const d = document.createElement('div');
            d.className = 'siswa-item' + (terpilih && terpilih.id === s.id ? ' selected' : '');
            d.textContent = s.nama + ' — NIS: ' + s.nis;
            d.onclick = () => pilihSiswa(s);
            daftarSiswaEl.appendChild(d);
        });
        daftarSiswaEl.style.display = 'block';
    }

    function pilihSiswa(s) {
        terpilih = s;
        siswaIdEl.value = s.id;
        cariSEl.value = s.nama;
        labelSiswaEl.textContent = s.nama + ' — NIS: ' + s.nis;
        namaTerpilihEl.style.display = 'block';
        daftarSiswaEl.style.display = 'none';
    }

    function filterSiswa() {
        const k = cariSEl.value.trim().toLowerCase();
        if (!k) return render(siswaTerpilihKelas);
        const hasil = siswaTerpilihKelas.filter(s => 
            s.nama.toLowerCase().includes(k) || s.nis.includes(k)
        );
        render(hasil);
    }

    document.addEventListener('click', e => {
        if (!cariSEl.contains(e.target) && !daftarSiswaEl.contains(e.target)) {
            daftarSiswaEl.style.display = 'none';
        }
    });

    cariSEl.addEventListener('input', filterSiswa);
    cariSEl.addEventListener('focus', () => {
        if (siswaTerpilihKelas.length > 0) render(siswaTerpilihKelas);
    });

    function tampilJenisPelanggaran() {
        const kategoriId = kategoriSelectEl.value;
        jenisSelectEl.innerHTML = '<option value="">-- Pilih Jenis Pelanggaran --</option>';
        if (!kategoriId) return;
        semuaJenis.forEach(opt => {
            if (opt.getAttribute('data-kategori') === kategoriId) {
                jenisSelectEl.appendChild(opt.cloneNode(true));
            }
        });
    }
</script>

<?php file_exists("footer.php") && include "footer.php"; ?>
</body>
</html>