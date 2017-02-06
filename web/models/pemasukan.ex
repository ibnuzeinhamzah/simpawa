defmodule Simpawa.Pemasukan do
  use Simpawa.Web, :model

  schema "pemasukan" do
    field :tanggal, Ecto.Date
    field :jumlah, :float
    field :keterangan, :string
    belongs_to :id_anggota, Simpawa.IdAnggota
    belongs_to :id_pemasukan, Simpawa.IdPemasukan

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:tanggal, :jumlah, :keterangan])
    |> validate_required([:tanggal, :jumlah, :keterangan])
  end
end
