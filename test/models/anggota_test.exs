defmodule Simpawa.AnggotaTest do
  use Simpawa.ModelCase

  alias Simpawa.Anggota

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Anggota.changeset(%Anggota{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Anggota.changeset(%Anggota{}, @invalid_attrs)
    refute changeset.valid?
  end
end
