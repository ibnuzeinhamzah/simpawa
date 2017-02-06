defmodule Simpawa.LokasiArisanTest do
  use Simpawa.ModelCase

  alias Simpawa.LokasiArisan

  @valid_attrs %{tanggal: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LokasiArisan.changeset(%LokasiArisan{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LokasiArisan.changeset(%LokasiArisan{}, @invalid_attrs)
    refute changeset.valid?
  end
end
