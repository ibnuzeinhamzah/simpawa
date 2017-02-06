defmodule Simpawa.Repo.Migrations.CreatePengeluaranArisan do
  use Ecto.Migration

  def change do
    create table(:pengeluaranarisan) do
      add :tanggal, :date
      add :jumlah, :float
      add :keterangan, :string
      add :penerima, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:pengeluaranarisan, [:penerima])

  end
end
