defmodule Simpawa.JenisPemasukanControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.JenisPemasukan
  @valid_attrs %{pemasukan: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, jenis_pemasukan_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing jenispemasukan"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, jenis_pemasukan_path(conn, :new)
    assert html_response(conn, 200) =~ "New jenis pemasukan"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, jenis_pemasukan_path(conn, :create), jenis_pemasukan: @valid_attrs
    assert redirected_to(conn) == jenis_pemasukan_path(conn, :index)
    assert Repo.get_by(JenisPemasukan, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, jenis_pemasukan_path(conn, :create), jenis_pemasukan: @invalid_attrs
    assert html_response(conn, 200) =~ "New jenis pemasukan"
  end

  test "shows chosen resource", %{conn: conn} do
    jenis_pemasukan = Repo.insert! %JenisPemasukan{}
    conn = get conn, jenis_pemasukan_path(conn, :show, jenis_pemasukan)
    assert html_response(conn, 200) =~ "Show jenis pemasukan"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, jenis_pemasukan_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    jenis_pemasukan = Repo.insert! %JenisPemasukan{}
    conn = get conn, jenis_pemasukan_path(conn, :edit, jenis_pemasukan)
    assert html_response(conn, 200) =~ "Edit jenis pemasukan"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    jenis_pemasukan = Repo.insert! %JenisPemasukan{}
    conn = put conn, jenis_pemasukan_path(conn, :update, jenis_pemasukan), jenis_pemasukan: @valid_attrs
    assert redirected_to(conn) == jenis_pemasukan_path(conn, :show, jenis_pemasukan)
    assert Repo.get_by(JenisPemasukan, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    jenis_pemasukan = Repo.insert! %JenisPemasukan{}
    conn = put conn, jenis_pemasukan_path(conn, :update, jenis_pemasukan), jenis_pemasukan: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit jenis pemasukan"
  end

  test "deletes chosen resource", %{conn: conn} do
    jenis_pemasukan = Repo.insert! %JenisPemasukan{}
    conn = delete conn, jenis_pemasukan_path(conn, :delete, jenis_pemasukan)
    assert redirected_to(conn) == jenis_pemasukan_path(conn, :index)
    refute Repo.get(JenisPemasukan, jenis_pemasukan.id)
  end
end
