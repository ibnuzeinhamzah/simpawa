defmodule Simpawa.DanaArisanTest do
  use Simpawa.ModelCase

  alias Simpawa.DanaArisan

  @valid_attrs %{jumlah: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DanaArisan.changeset(%DanaArisan{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DanaArisan.changeset(%DanaArisan{}, @invalid_attrs)
    refute changeset.valid?
  end
end
