defmodule Simpawa.Repo.Migrations.CreateSimpananPokok do
  use Ecto.Migration

  def change do
    create table(:simpananpokok) do
      add :tanggal, :datetime
      add :jumlah, :float
      add :id_anggota, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:simpananpokok, [:id_anggota])

  end
end
