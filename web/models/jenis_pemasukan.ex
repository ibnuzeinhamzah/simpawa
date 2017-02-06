defmodule Simpawa.JenisPemasukan do
  use Simpawa.Web, :model

  schema "jenispemasukan" do
    field :pemasukan, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:pemasukan])
    |> validate_required([:pemasukan])
  end
end
