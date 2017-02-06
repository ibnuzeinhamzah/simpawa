defmodule Simpawa.PengeluaranArisan do
  use Simpawa.Web, :model

  schema "pengeluaranarisan" do
    field :tanggal, Ecto.Date
    field :jumlah, :float
    field :keterangan, :string
    belongs_to :penerima, Simpawa.Penerima

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
