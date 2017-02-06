defmodule Simpawa.JenisPengeluaranTest do
  use Simpawa.ModelCase

  alias Simpawa.JenisPengeluaran

  @valid_attrs %{pengeluaran: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = JenisPengeluaran.changeset(%JenisPengeluaran{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = JenisPengeluaran.changeset(%JenisPengeluaran{}, @invalid_attrs)
    refute changeset.valid?
  end
end
