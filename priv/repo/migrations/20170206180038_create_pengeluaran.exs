defmodule Simpawa.Repo.Migrations.CreatePengeluaran do
  use Ecto.Migration

  def change do
    create table(:pengeluaran) do
      add :tanggal, :date
      add :jumlah, :float
      add :keterangan, :string
      add :id_pengeluaran, references(:jenispengeluaran, on_delete: :nothing)
      add :penerima, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:pengeluaran, [:id_pengeluaran])
    create index(:pengeluaran, [:penerima])

  end
end
