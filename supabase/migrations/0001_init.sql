-- supabase/migrations/0001_init.sql
create extension if not exists "pgcrypto";

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  name text not null check (char_length(name) between 3 and 16),
  avatar_id text not null default 'a01',
  level int not null default 1,
  exp int not null default 0,
  coins int not null default 0 check (coins >= 0),
  gems int not null default 0 check (gems >= 0),
  tokens int not null default 0 check (tokens >= 0),
  tickets int not null default 0 check (tickets >= 0),
  elo int not null default 1000,
  max_depth int not null default 0,
  friend_code text unique not null default substr(encode(gen_random_bytes(5), 'hex'), 1, 8),
  badges jsonb not null default '[]',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.creatures (
  uid uuid primary key,
  user_id uuid not null references public.profiles(id) on delete cascade,
  species_id int not null,
  data jsonb not null,
  slot_kind text not null default 'pc',
  slot_index int,
  deleted boolean not null default false,
  updated_at timestamptz not null default now()
);
create index if not exists idx_creatures_user_updated on public.creatures (user_id, updated_at);

create table if not exists public.inventory (
  user_id uuid not null references public.profiles(id) on delete cascade,
  item_id text not null,
  quantity int not null check (quantity >= 0),
  updated_at timestamptz not null default now(),
  primary key (user_id, item_id)
);

create table if not exists public.balance_config (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.creatures enable row level security;
alter table public.inventory enable row level security;
alter table public.balance_config enable row level security;

create policy profiles_read on public.profiles for select using (true);
create policy profiles_update_self on public.profiles for update using (auth.uid() = id);

create policy creatures_own on public.creatures for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy inventory_own on public.inventory for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy balance_read on public.balance_config for select using (true);
