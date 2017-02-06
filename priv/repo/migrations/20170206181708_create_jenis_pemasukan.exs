defmodule Simpawa.Repo.Migrations.CreateJenisPemasukan do
  use Ecto.Migration

  def change do
    create table(:jenispemasukan) do
      add :pemasukan, :string

      timestamps()
    end

  end
end
