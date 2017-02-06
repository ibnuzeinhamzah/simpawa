defmodule Simpawa.Repo.Migrations.CreateLokasiArisan do
  use Ecto.Migration

  def change do
    create table(:lokasiarisan) do
      add :tanggal, :datetime
      add :lokasi, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:lokasiarisan, [:lokasi])

  end
end
