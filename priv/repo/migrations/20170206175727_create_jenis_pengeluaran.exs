defmodule Simpawa.Repo.Migrations.CreateJenisPengeluaran do
  use Ecto.Migration

  def change do
    create table(:jenispengeluaran) do
      add :pengeluaran, :string

      timestamps()
    end

  end
end
