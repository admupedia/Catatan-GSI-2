# Kesan & Pesan – Green Social Impact #2

## 1. Siapkan database (Supabase, gratis)
1. Buat akun & project baru di https://supabase.com
2. Buka **SQL Editor** → tempel isi `schema.sql` → **Run**
3. **Authentication → Providers → Email**: matikan "Allow new users to sign up"
4. **Authentication → Users → Add user**: buat akun admin (email + password) → centang "Auto Confirm"
5. **Project Settings → API**: salin **Project URL** dan **anon public key**

## 2. Isi konfigurasi
Buka `index.html`, cari baris:
    var SB_URL="ISI_SUPABASE_URL",SB_KEY="ISI_SUPABASE_ANON_KEY";
Ganti dengan URL dan anon key dari langkah 5. (anon key aman dipublikasikan karena dibatasi aturan RLS di schema.sql.)

## 3. Deploy
1. Upload `index.html`, `schema.sql`, `README.md` ke repo GitHub baru
2. Netlify → **Add new site → Import from Git** → pilih repo
3. Build command: kosongkan. Publish directory: `.` → **Deploy**

## Admin
Ketuk judul "BAGIKAN CERITA KAMU DISINI" 5 kali → login dengan akun admin dari langkah 4.
