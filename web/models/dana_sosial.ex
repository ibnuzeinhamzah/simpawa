defmodule Simpawa.DanaSosial do
  use Simpawa.Web, :model

  schema "danasosial" do
    field :tanggal, Ecto.DateTime
    field :jumlah, :float
    belongs_to :id_anggota, Simpawa.IdAnggota

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:tanggal, :jumlah])
    |> validate_required([:tanggal, :jumlah])
  end
end
