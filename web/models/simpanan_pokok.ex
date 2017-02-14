defmodule Simpawa.SimpananPokok do
  use Simpawa.Web, :model

  schema "simpananpokok" do
    field :jumlah, :float
    belongs_to :anggota, Simpawa.Anggota

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:jumlah,:anggota_id])
    |> validate_required([:jumlah])
  end
end
