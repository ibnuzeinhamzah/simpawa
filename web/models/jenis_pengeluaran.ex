defmodule Simpawa.JenisPengeluaran do
  use Simpawa.Web, :model

  schema "jenispengeluaran" do
    field :pengeluaran, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:pengeluaran])
    |> validate_required([:pengeluaran])
  end
end
