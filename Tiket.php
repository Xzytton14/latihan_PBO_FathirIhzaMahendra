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