defmodule Simpawa.PemasukanTest do
  use Simpawa.ModelCase

  alias Simpawa.Pemasukan

  @valid_attrs %{jumlah: "120.5", keterangan: "some content", tanggal: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pemasukan.changeset(%Pemasukan{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pemasukan.changeset(%Pemasukan{}, @invalid_attrs)
    refute changeset.valid?
  end
end
