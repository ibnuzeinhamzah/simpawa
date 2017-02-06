defmodule Simpawa.Repo.Migrations.CreatePengeluaranSosial do
  use Ecto.Migration

  def change do
    create table(:pengeluaransosial) do
      add :tanggal, :date
      add :jumlah, :float
      add :keterangan, :string
      add :penerima, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:pengeluaransosial, [:penerima])

  end
end
