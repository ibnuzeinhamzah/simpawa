defmodule Simpawa.DanaSosialControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.DanaSosial
  @valid_attrs %{jumlah: "120.5", tanggal: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, dana_sosial_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing danasosial"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, dana_sosial_path(conn, :new)
    assert html_response(conn, 200) =~ "New dana sosial"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, dana_sosial_path(conn, :create), dana_sosial: @valid_attrs
    assert redirected_to(conn) == dana_sosial_path(conn, :index)
    assert Repo.get_by(DanaSosial, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dana_sosial_path(conn, :create), dana_sosial: @invalid_attrs
    assert html_response(conn, 200) =~ "New dana sosial"
  end

  test "shows chosen resource", %{conn: conn} do
    dana_sosial = Repo.insert! %DanaSosial{}
    conn = get conn, dana_sosial_path(conn, :show, dana_sosial)
    assert html_response(conn, 200) =~ "Show dana sosial"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, dana_sosial_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    dana_sosial = Repo.insert! %DanaSosial{}
    conn = get conn, dana_sosial_path(conn, :edit, dana_sosial)
    assert html_response(conn, 200) =~ "Edit dana sosial"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    dana_sosial = Repo.insert! %DanaSosial{}
    conn = put conn, dana_sosial_path(conn, :update, dana_sosial), dana_sosial: @valid_attrs
    assert redirected_to(conn) == dana_sosial_path(conn, :show, dana_sosial)
    assert Repo.get_by(DanaSosial, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    dana_sosial = Repo.insert! %DanaSosial{}
    conn = put conn, dana_sosial_path(conn, :update, dana_sosial), dana_sosial: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit dana sosial"
  end

  test "deletes chosen resource", %{conn: conn} do
    dana_sosial = Repo.insert! %DanaSosial{}
    conn = delete conn, dana_sosial_path(conn, :delete, dana_sosial)
    assert redirected_to(conn) == dana_sosial_path(conn, :index)
    refute Repo.get(DanaSosial, dana_sosial.id)
  end
end
