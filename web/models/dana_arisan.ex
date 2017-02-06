defmodule Simpawa.DanaArisan do
  use Simpawa.Web, :model

  schema "danaarisan" do
    field :jumlah, :float
    belongs_to :idlokasi, Simpawa.Idlokasi
    belongs_to :id_anggota, Simpawa.IdAnggota

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:jumlah])
    |> validate_required([:jumlah])
  end
end
