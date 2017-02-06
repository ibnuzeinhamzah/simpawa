defmodule Simpawa.Repo.Migrations.CreatePemasukan do
  use Ecto.Migration

  def change do
    create table(:pemasukan) do
      add :tanggal, :date
      add :jumlah, :float
      add :keterangan, :string
      add :id_anggota, references(:anggota, on_delete: :nothing)
      add :id_pemasukan, references(:jenispemasukan, on_delete: :nothing)

      timestamps()
    end
    create index(:pemasukan, [:id_anggota])
    create index(:pemasukan, [:id_pemasukan])

  end
end
