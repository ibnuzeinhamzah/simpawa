defmodule Simpawa.Repo.Migrations.CreateDanaArisan do
  use Ecto.Migration

  def change do
    create table(:danaarisan) do
      add :jumlah, :float
      add :idlokasi, references(:lokasiarisan, on_delete: :nothing)
      add :id_anggota, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:danaarisan, [:idlokasi])
    create index(:danaarisan, [:id_anggota])

  end
end
