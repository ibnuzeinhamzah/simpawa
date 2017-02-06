defmodule Simpawa.LokasiArisanControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.LokasiArisan
  @valid_attrs %{tanggal: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, lokasi_arisan_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing lokasiarisan"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, lokasi_arisan_path(conn, :new)
    assert html_response(conn, 200) =~ "New lokasi arisan"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, lokasi_arisan_path(conn, :create), lokasi_arisan: @valid_attrs
    assert redirected_to(conn) == lokasi_arisan_path(conn, :index)
    assert Repo.get_by(LokasiArisan, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, lokasi_arisan_path(conn, :create), lokasi_arisan: @invalid_attrs
    assert html_response(conn, 200) =~ "New lokasi arisan"
  end

  test "shows chosen resource", %{conn: conn} do
    lokasi_arisan = Repo.insert! %LokasiArisan{}
    conn = get conn, lokasi_arisan_path(conn, :show, lokasi_arisan)
    assert html_response(conn, 200) =~ "Show lokasi arisan"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, lokasi_arisan_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    lokasi_arisan = Repo.insert! %LokasiArisan{}
    conn = get conn, lokasi_arisan_path(conn, :edit, lokasi_arisan)
    assert html_response(conn, 200) =~ "Edit lokasi arisan"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    lokasi_arisan = Repo.insert! %LokasiArisan{}
    conn = put conn, lokasi_arisan_path(conn, :update, lokasi_arisan), lokasi_arisan: @valid_attrs
    assert redirected_to(conn) == lokasi_arisan_path(conn, :show, lokasi_arisan)
    assert Repo.get_by(LokasiArisan, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    lokasi_arisan = Repo.insert! %LokasiArisan{}
    conn = put conn, lokasi_arisan_path(conn, :update, lokasi_arisan), lokasi_arisan: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit lokasi arisan"
  end

  test "deletes chosen resource", %{conn: conn} do
    lokasi_arisan = Repo.insert! %LokasiArisan{}
    conn = delete conn, lokasi_arisan_path(conn, :delete, lokasi_arisan)
    assert redirected_to(conn) == lokasi_arisan_path(conn, :index)
    refute Repo.get(LokasiArisan, lokasi_arisan.id)
  end
end
