defmodule Simpawa.Repo.Migrations.CreateAnggota do
  use Ecto.Migration

  def change do
    create table(:anggota) do
      add :name, :string

      timestamps()
    end

  end
end
