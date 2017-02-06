defmodule Simpawa.DanaSosialTest do
  use Simpawa.ModelCase

  alias Simpawa.DanaSosial

  @valid_attrs %{jumlah: "120.5", tanggal: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DanaSosial.changeset(%DanaSosial{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DanaSosial.changeset(%DanaSosial{}, @invalid_attrs)
    refute changeset.valid?
  end
end
