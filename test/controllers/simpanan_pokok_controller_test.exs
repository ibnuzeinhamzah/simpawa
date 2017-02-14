defmodule Simpawa.SimpananPokokControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.SimpananPokok
  @valid_attrs %{jumlah: "120.5"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, simpanan_pokok_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing simpananpokok"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, simpanan_pokok_path(conn, :new)
    assert html_response(conn, 200) =~ "New simpanan pokok"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, simpanan_pokok_path(conn, :create), simpanan_pokok: @valid_attrs
    assert redirected_to(conn) == simpanan_pokok_path(conn, :index)
    assert Repo.get_by(SimpananPokok, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, simpanan_pokok_path(conn, :create), simpanan_pokok: @invalid_attrs
    assert html_response(conn, 200) =~ "New simpanan pokok"
  end

  test "shows chosen resource", %{conn: conn} do
    simpanan_pokok = Repo.insert! %SimpananPokok{}
    conn = get conn, simpanan_pokok_path(conn, :show, simpanan_pokok)
    assert html_response(conn, 200) =~ "Show simpanan pokok"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, simpanan_pokok_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    simpanan_pokok = Repo.insert! %SimpananPokok{}
    conn = get conn, simpanan_pokok_path(conn, :edit, simpanan_pokok)
    assert html_response(conn, 200) =~ "Edit simpanan pokok"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    simpanan_pokok = Repo.insert! %SimpananPokok{}
    conn = put conn, simpanan_pokok_path(conn, :update, simpanan_pokok), simpanan_pokok: @valid_attrs
    assert redirected_to(conn) == simpanan_pokok_path(conn, :show, simpanan_pokok)
    assert Repo.get_by(SimpananPokok, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    simpanan_pokok = Repo.insert! %SimpananPokok{}
    conn = put conn, simpanan_pokok_path(conn, :update, simpanan_pokok), simpanan_pokok: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit simpanan pokok"
  end

  test "deletes chosen resource", %{conn: conn} do
    simpanan_pokok = Repo.insert! %SimpananPokok{}
    conn = delete conn, simpanan_pokok_path(conn, :delete, simpanan_pokok)
    assert redirected_to(conn) == simpanan_pokok_path(conn, :index)
    refute Repo.get(SimpananPokok, simpanan_pokok.id)
  end
end
