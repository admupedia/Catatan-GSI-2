-- Jalankan di Supabase: SQL Editor > New query > Run
create table if not exists docs (
  id text primary key,
  col text not null,
  data jsonb not null,
  created_at timestamptz default now()
);
create index if not exists docs_col_idx on docs(col);

alter table docs enable row level security;

-- Semua orang boleh membaca pesan & balasan. Data 'priv' (nama asli anonim + username IG) hanya admin.
create policy "baca" on docs for select
  using (col <> 'priv' or auth.role() = 'authenticated');

-- Semua orang boleh mengirim pesan, balasan, dan data priv (dengan batas ukuran).
create policy "kirim" on docs for insert
  with check (col in ('msgs','replies','priv') and pg_column_size(data) < 400000);

-- Hanya admin (login) yang boleh ubah / hapus.
create policy "admin ubah" on docs for update to authenticated using (true) with check (true);
create policy "admin hapus" on docs for delete to authenticated using (true);

-- Aktifkan update real-time
alter publication supabase_realtime add table docs;
