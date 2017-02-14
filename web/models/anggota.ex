defmodule Simpawa.Anggota do
  use Simpawa.Web, :model

  schema "anggota" do
    has_one :simpananpokok, Simpawa.SimpananPokok
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
