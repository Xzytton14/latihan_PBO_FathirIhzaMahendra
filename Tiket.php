<?php

// Membuat abstract class bernama Tiket
abstract class Tiket {
    
    // Properti/Atribut Terenkapsulasi (protected)
    // Sesuai dengan kolom database di Tahap 1
    protected $id_tiket;
    protected $nama_film;
    protected $jadwal_tayang;
    protected $jumlah_kursi;
    protected $hargaDasarTiket;

    // Constructor untuk memetakan data dari database ke properti objek
    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket) {
        $this->id_tiket = $id_tiket;
        $this->nama_film = $nama_film;
        $this->jadwal_tayang = $jadwal_tayang;
        $this->jumlah_kursi = $jumlah_kursi;
        $this->hargaDasarTiket = $hargaDasarTiket;
    }

    // Metode Abstrak 1: Wajib dideklarasikan tanpa isi/body untuk menghitung total harga
    abstract public function hitungTotalHarga();

    // Metode Abstrak 2: Wajib dideklarasikan tanpa isi/body untuk menampilkan fasilitas
    abstract public function tampilkanInfoFasilitas();
}
// ==========================================
// 1. KELAS ANAK: TiketRegular
// ==========================================
class TiketRegular extends Tiket {
    // Properti tambahan spesifik
    private $tipeAudio;
    private $lokasiBaris;

    // Constructor Kelas Anak
    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket, $tipeAudio, $lokasiBaris) {
        // Mengirim data global ke Constructor milik kelas induk (Tiket)
        parent::__construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket);
        
        // Mengisi properti spesifik
        $this->tipeAudio = $tipeAudio;
        $this->lokasiBaris = $lokasiBaris;
    }

    // Mengimplementasikan metode abstrak hitungTotalHarga
    public function hitungTotalHarga() {
        // Misal: Tiket regular tidak ada biaya tambahan, hanya harga dasar dikali jumlah kursi
        return $this->hargaDasarTiket * $this->jumlah_kursi;
    }

    // Mengimplementasikan metode abstrak tampilkanInfoFasilitas
    public function tampilkanInfoFasilitas() {
        echo "Fasilitas Studio Regular:<br>";
        echo "- Tipe Audio: " . $this->tipeAudio . "<br>";
        echo "- Lokasi Baris Kursi: " . $this->lokasiBaris . "<br>";
    }
}


// ==========================================
// 2. KELAS ANAK: TiketIMAX
// ==========================================
class TiketIMAX extends Tiket {
    // Properti tambahan spesifik
    private $kacamata3dId;
    private $efekGerakFitur;

    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket, $kacamata3dId, $efekGerakFitur) {
        parent::__construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket);
        $this->kacamata3dId = $kacamata3dId;
        $this->efekGerakFitur = $efekGerakFitur;
    }

    public function hitungTotalHarga() {
        // Misal: Studio IMAX ada biaya tambahan teknologi sebesar Rp 25.000 per kursi
        $biayaTambahanIMAX = 25000;
        return ($this->hargaDasarTiket + $biayaTambahanIMAX) * $this->jumlah_kursi;
    }

    public function tampilkanInfoFasilitas() {
        echo "Fasilitas Studio IMAX:<br>";
        echo "- ID Kacamata 3D: " . $this->kacamata3dId . "<br>";
        echo "- Fitur Efek Gerak Kursi: " . $this->efekGerakFitur . "<br>";
    }
}


// ==========================================
// 3. KELAS ANAK: TiketVelvet
// ==========================================
class TiketVelvet extends Tiket {
    // Properti tambahan spesifik (menggunakan tipe data boolean dari database)
    private $bantalSelimutPack;
    private $layananButler;

    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket, $bantalSelimutPack, $layananButler) {
        parent::__construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $hargaDasarTiket);
        $this->bantalSelimutPack = $bantalSelimutPack;
        $this->layananButler = $layananButler;
    }

    public function hitungTotalHarga() {
        // Misal: Studio Velvet ada biaya premium layanan super mewah sebesar Rp 75.000 per kursi
        $biayaPremiumVelvet = 75000;
        return ($this->hargaDasarTiket + $biayaPremiumVelvet) * $this->jumlah_kursi;
    }

    public function tampilkanInfoFasilitas() {
        echo "Fasilitas Studio Velvet:<br>";
        echo "- Paket Bantal & Selimut: " . ($this->bantalSelimutPack ? "Tersedia" : "Tidak Tersedia") . "<br>";
        echo "- Layanan Butler (Pelayan Pribadi): " . ($this->layananButler ? "Aktif" : "Tidak Aktif") . "<br>";
    }
}