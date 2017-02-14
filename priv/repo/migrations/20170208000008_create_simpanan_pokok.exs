defmodule Simpawa.Repo.Migrations.CreateSimpananPokok do
  use Ecto.Migration

  def change do
    create table(:simpananpokok) do
      add :jumlah, :float
      add :anggota_id, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:simpananpokok, [:anggota_id])

  end
end
