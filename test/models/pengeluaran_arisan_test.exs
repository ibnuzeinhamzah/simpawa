defmodule Simpawa.PengeluaranArisanTest do
  use Simpawa.ModelCase

  alias Simpawa.PengeluaranArisan

  @valid_attrs %{jumlah: "120.5", keterangan: "some content", tanggal: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PengeluaranArisan.changeset(%PengeluaranArisan{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PengeluaranArisan.changeset(%PengeluaranArisan{}, @invalid_attrs)
    refute changeset.valid?
  end
end
