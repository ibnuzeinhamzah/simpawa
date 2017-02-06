defmodule Simpawa.Repo.Migrations.CreateSimpananWajib do
  use Ecto.Migration

  def change do
    create table(:simpananwajib) do
      add :tanggal, :datetime
      add :jumlah, :float
      add :id_anggota, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:simpananwajib, [:id_anggota])

  end
end
