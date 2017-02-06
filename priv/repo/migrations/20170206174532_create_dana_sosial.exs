defmodule Simpawa.Repo.Migrations.CreateDanaSosial do
  use Ecto.Migration

  def change do
    create table(:danasosial) do
      add :tanggal, :datetime
      add :jumlah, :float
      add :id_anggota, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:danasosial, [:id_anggota])

  end
end
