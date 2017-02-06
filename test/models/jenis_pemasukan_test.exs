defmodule Simpawa.JenisPemasukanTest do
  use Simpawa.ModelCase

  alias Simpawa.JenisPemasukan

  @valid_attrs %{pemasukan: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = JenisPemasukan.changeset(%JenisPemasukan{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = JenisPemasukan.changeset(%JenisPemasukan{}, @invalid_attrs)
    refute changeset.valid?
  end
end
