defmodule Simpawa.LokasiArisan do
  use Simpawa.Web, :model

  schema "lokasiarisan" do
    field :tanggal, Ecto.DateTime
    belongs_to :lokasi, Simpawa.Lokasi

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:tanggal])
    |> validate_required([:tanggal])
  end
end
