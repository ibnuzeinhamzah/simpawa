defmodule Simpawa.SimpananPokokTest do
  use Simpawa.ModelCase

  alias Simpawa.SimpananPokok

  @valid_attrs %{jumlah: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SimpananPokok.changeset(%SimpananPokok{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SimpananPokok.changeset(%SimpananPokok{}, @invalid_attrs)
    refute changeset.valid?
  end
end
