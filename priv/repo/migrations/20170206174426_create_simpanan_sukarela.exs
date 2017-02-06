defmodule Simpawa.Repo.Migrations.CreateSimpananSukarela do
  use Ecto.Migration

  def change do
    create table(:simpanansukarela) do
      add :tanggal, :datetime
      add :jumlah, :float
      add :id_anggota, references(:anggota, on_delete: :nothing)

      timestamps()
    end
    create index(:simpanansukarela, [:id_anggota])

  end
end
