-- ==========================================
-- 1. STRUKTUR TABEL (CREATE TABLE)
-- ==========================================

DROP TABLE IF EXISTS tiket;

CREATE TABLE tiket (
    -- Atribut Global (Induk) dengan Auto Increment & Primary Key
    id_tiket INT NOT NULL AUTO_INCREMENT,
    nama_film VARCHAR(255) NOT NULL,
    jadwal_tayang DATETIME NOT NULL,
    jumlah_kursi INT NOT NULL,
    harga_dasar_tiket DECIMAL(10, 2) NOT NULL,
    jenis_studio ENUM('regular', 'imax', 'velvet') NOT NULL,
    
    -- Atribut Spesifik (Anak - Set menjadi Nullable)
    tipe_audio VARCHAR(50) NULL,
    lokasi_baris VARCHAR(50) NULL, -- Sudah diperlebar ke 50 karakter agar muat text Velvet
    kacamata_3d_id VARCHAR(50) NULL,
    efek_gerak_fitur VARCHAR(100) NULL,
    bantal_selimut_pack BOOLEAN NULL,
    layanan_butler BOOLEAN NULL,
    
    -- Primary Key
    PRIMARY KEY (id_tiket),
    
    -- Validasi Bisnis (Integritas Data Atribut Spesifik)
    CONSTRAINT chk_fasilitas_studio CHECK (
        (jenis_studio = 'regular' AND bantal_selimut_pack IS NULL AND layanan_butler IS NULL) OR
        (jenis_studio = 'imax'    AND bantal_selimut_pack IS NULL AND layanan_butler IS NULL) OR
        (jenis_studio = 'velvet'  AND kacamata_3d_id IS NULL AND efek_gerak_fitur IS NULL)
    )
);


-- ==========================================
-- 2. DATA CONTOH (INSERT INTO) - TOTAL 60 DATA
-- ==========================================

-- BATCH 1: 15 Film dengan 2 Opsi Studio (Regular & IMAX) -> 30 Data
INSERT INTO tiket (nama_film, jadwal_tayang, jumlah_kursi, harga_dasar_tiket, jenis_studio, tipe_audio, lokasi_baris, kacamata_3d_id, efek_gerak_fitur) VALUES
('Avatar: Fire and Ash', '2026-07-10 13:00:00', 2, 50000.00, 'regular', 'Dolby Atmos 7.1', 'Row E', NULL, NULL),
('Avatar: Fire and Ash', '2026-07-10 15:30:00', 2, 95000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-001', 'Hydraulic Shaking'),

('The Batman Part II', '2026-07-10 14:30:00', 4, 60000.00, 'regular', 'DTS:X', 'Row C', NULL, NULL),
('The Batman Part II', '2026-07-10 21:00:00', 1, 110000.00, 'imax', 'IMAX Dual Laser Audio', 'Row VIP', 'GLS-3D-009', 'None'),

('Avengers: Doomsday', '2026-07-11 11:00:00', 3, 55000.00, 'regular', 'Dolby Atmos 7.1', 'Row A', NULL, NULL),
('Avengers: Doomsday', '2026-07-11 12:30:00', 2, 100000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-014', 'Wind & Flash'),

('Spider-Man: Beyond the Spider-Verse', '2026-07-11 13:15:00', 1, 50000.00, 'regular', 'Standard Stereo', 'Row G', NULL, NULL),
('Spider-Man: Beyond the Spider-Verse', '2026-07-11 14:45:00', 3, 90000.00, 'imax', 'IMAX Dual Laser Audio', 'Row Upper', 'GLS-3D-041', 'None'),

('Inception 2', '2026-07-12 19:00:00', 2, 65000.00, 'regular', 'DTS:X', 'Row F', NULL, NULL),
('Inception 2', '2026-07-12 13:00:00', 2, 110000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-088', 'Vibration Plus'),

('Interstellar (Rerelease)', '2026-07-12 10:30:00', 1, 45000.00, 'regular', 'Standard Stereo', 'Row H', NULL, NULL),
('Interstellar (Rerelease)', '2026-07-12 21:00:00', 2, 95000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-102', 'None'),

('Dune: Part Three', '2026-07-13 15:00:00', 2, 60000.00, 'regular', 'Dolby Atmos 7.1', 'Row C', NULL, NULL),
('Dune: Part Three', '2026-07-13 14:00:00', 2, 105000.00, 'imax', 'IMAX Dual Laser Audio', 'Row Center', 'GLS-3D-115', 'Ambient Smoke'),

('Star Wars: New Jedi Order', '2026-07-14 12:00:00', 2, 55000.00, 'regular', 'DTS:X', 'Row E', NULL, NULL),
('Star Wars: New Jedi Order', '2026-07-14 15:30:00', 2, 100000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-201', 'Hydraulic Shaking'),

('Superman: Legacy', '2026-07-15 11:00:00', 2, 50000.00, 'regular', 'Dolby Atmos', 'Row D', NULL, NULL),
('Superman: Legacy', '2026-07-15 14:00:00', 2, 95000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-305', 'Wind FX'),

('Jurassic World 4', '2026-07-15 16:30:00', 1, 55000.00, 'regular', 'DTS:X', 'Row F', NULL, NULL),
('Jurassic World 4', '2026-07-15 19:30:00', 4, 100000.00, 'imax', 'IMAX Dual Laser', 'Row VIP', 'GLS-3D-402', 'Hydraulic Shaking'),

('Matrix 5', '2026-07-16 13:00:00', 2, 60000.00, 'regular', 'Standard Stereo', 'Row B', NULL, NULL),
('Matrix 5', '2026-07-16 16:00:00', 2, 110000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-512', 'Vibration Plus'),

('Mission Impossible 9', '2026-07-16 18:30:00', 3, 65000.00, 'regular', 'Dolby Atmos 7.1', 'Row G', NULL, NULL),
('Mission Impossible 9', '2026-07-16 21:15:00', 2, 120000.00, 'imax', 'IMAX Dual Laser', 'Row VIP', 'GLS-3D-601', 'None'),

('Fast X: Part 2', '2026-07-17 14:00:00', 2, 50000.00, 'regular', 'DTS:X', 'Row C', NULL, NULL),
('Fast X: Part 2', '2026-07-17 17:30:00', 2, 95000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-710', 'Hydraulic Shaking'),

('Gladiator III', '2026-07-17 19:00:00', 1, 60000.00, 'regular', 'Dolby Atmos', 'Row E', NULL, NULL),
('Gladiator III', '2026-07-17 21:45:00', 2, 105000.00, 'imax', 'IMAX Dual Laser', 'Row Center', 'GLS-3D-815', 'None'),

('Blade Runner 2050', '2026-07-18 12:00:00', 2, 55000.00, 'regular', 'DTS:X', 'Row A', NULL, NULL),
('Blade Runner 2050', '2026-07-18 15:00:00', 2, 100000.00, 'imax', 'IMAX 12-Channel', 'Row VIP', 'GLS-3D-901', 'Ambient Smoke');


-- BATCH 2: 10 Film Baru dengan 3 Opsi Studio Sekaligus (Regular, IMAX, Velvet) -> 30 Data
INSERT INTO tiket (nama_film, jadwal_tayang, jumlah_kursi, harga_dasar_tiket, jenis_studio, tipe_audio, lokasi_baris, kacamata_3d_id, efek_gerak_fitur, bantal_selimut_pack, layanan_butler) VALUES
('Shrek 5', '2026-08-20 13:00:00', 2, 50000.00, 'regular', 'Dolby Atmos 7.1', 'Row D', NULL, NULL, NULL, NULL),
('Shrek 5', '2026-08-20 15:30:00', 3, 95000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-A01', 'None', NULL, NULL),
('Shrek 5', '2026-08-20 18:00:00', 1, 150000.00, 'velvet', NULL, 'Row Suite 1', NULL, NULL, TRUE, TRUE),

('Tron: Ares', '2026-08-21 14:00:00', 2, 55000.00, 'regular', 'DTS:X', 'Row F', NULL, NULL, NULL, NULL),
('Tron: Ares', '2026-08-21 16:45:00', 2, 100000.00, 'imax', 'IMAX Dual Laser', 'Row VIP', 'GLS-3D-A02', 'Vibration Plus', NULL, NULL),
('Tron: Ares', '2026-08-21 19:30:00', 2, 160000.00, 'velvet', NULL, 'Row Suite 2', NULL, NULL, TRUE, TRUE),

('The Chronicles of Narnia', '2026-08-22 11:00:00', 4, 50000.00, 'regular', 'Standard Stereo', 'Row B', NULL, NULL, NULL, NULL),
('The Chronicles of Narnia', '2026-08-22 13:45:00', 2, 95000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-A03', 'Ambient Smoke', NULL, NULL),
('The Chronicles of Narnia', '2026-08-22 16:30:00', 1, 150000.00, 'velvet', NULL, 'Row Suite 3', NULL, NULL, TRUE, FALSE),

('Toy Story 5', '2026-08-23 12:30:00', 3, 50000.00, 'regular', 'Dolby Atmos', 'Row E', NULL, NULL, NULL, NULL),
('Toy Story 5', '2026-08-23 15:00:00', 4, 95000.00, 'imax', 'IMAX 12-Channel', 'Row Upper', 'GLS-3D-A04', 'None', NULL, NULL),
('Toy Story 5', '2026-08-23 17:30:00', 2, 150000.00, 'velvet', NULL, 'Row Suite 1', NULL, NULL, TRUE, TRUE),

('Pirates of the Caribbean 6', '2026-08-24 14:15:00', 2, 60000.00, 'regular', 'DTS:X', 'Row C', NULL, NULL, NULL, NULL),
('Pirates of the Caribbean 6', '2026-08-24 17:00:00', 2, 110000.00, 'imax', 'IMAX Dual Laser', 'Row Center', 'GLS-3D-A05', 'Hydraulic Shaking', NULL, NULL),
('Pirates of the Caribbean 6', '2026-08-24 20:00:00', 2, 175000.00, 'velvet', NULL, 'Row Suite 4', NULL, NULL, TRUE, TRUE),

('Frozen III', '2026-08-25 10:30:00', 2, 50000.00, 'regular', 'Dolby Atmos 7.1', 'Row G', NULL, NULL, NULL, NULL),
('Frozen III', '2026-08-25 13:00:00', 3, 95000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-A06', 'Wind & Flash', NULL, NULL),
('Frozen III', '2026-08-25 15:45:00', 2, 150000.00, 'velvet', NULL, 'Row Suite 2', NULL, NULL, TRUE, FALSE),

('Star Trek: Starfleet Academy', '2026-08-26 13:30:00', 1, 55000.00, 'regular', 'DTS:X', 'Row A', NULL, NULL, NULL, NULL),
('Star Trek: Starfleet Academy', '2026-08-26 16:15:00', 2, 105000.00, 'imax', 'IMAX Dual Laser', 'Row VIP', 'GLS-3D-A07', 'None', NULL, NULL),
('Star Trek: Starfleet Academy', '2026-08-26 19:00:00', 2, 160000.00, 'velvet', NULL, 'Row Suite 5', NULL, NULL, TRUE, TRUE),

('Godzilla x Kong 3', '2026-08-27 15:00:00', 2, 55000.00, 'regular', 'Dolby Atmos', 'Row E', NULL, NULL, NULL, NULL),
('Godzilla x Kong 3', '2026-08-27 18:00:00', 2, 105000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-A08', 'Hydraulic Shaking', NULL, NULL),
('Godzilla x Kong 3', '2026-08-27 21:00:00', 2, 165000.00, 'velvet', NULL, 'Row Suite 3', NULL, NULL, TRUE, TRUE),

('Sherlock Holmes 3', '2026-08-28 12:00:00', 3, 60000.00, 'regular', 'Standard Stereo', 'Row D', NULL, NULL, NULL, NULL),
('Sherlock Holmes 3', '2026-08-28 14:45:00', 1, 110000.00, 'imax', 'IMAX Dual Laser', 'Row Upper', 'GLS-3D-A09', 'None', NULL, NULL),
('Sherlock Holmes 3', '2026-08-28 17:30:00', 4, 170000.00, 'velvet', NULL, 'Row Suite 1', NULL, NULL, TRUE, TRUE),

('Ghostbusters: Sequel', '2026-08-29 14:00:00', 2, 50000.00, 'regular', 'Dolby Atmos 7.1', 'Row F', NULL, NULL, NULL, NULL),
('Ghostbusters: Sequel', '2026-08-29 16:30:00', 2, 100000.00, 'imax', 'IMAX 12-Channel', 'Row Center', 'GLS-3D-A10', 'Vibration Plus', NULL, NULL),
('Ghostbusters: Sequel', '2026-08-29 19:15:00', 2, 150000.00, 'velvet', NULL, 'Row Suite 4', NULL, NULL, TRUE, FALSE);