defmodule Simpawa.JenisPengeluaranControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.JenisPengeluaran
  @valid_attrs %{pengeluaran: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, jenis_pengeluaran_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing jenispengeluaran"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, jenis_pengeluaran_path(conn, :new)
    assert html_response(conn, 200) =~ "New jenis pengeluaran"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, jenis_pengeluaran_path(conn, :create), jenis_pengeluaran: @valid_attrs
    assert redirected_to(conn) == jenis_pengeluaran_path(conn, :index)
    assert Repo.get_by(JenisPengeluaran, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, jenis_pengeluaran_path(conn, :create), jenis_pengeluaran: @invalid_attrs
    assert html_response(conn, 200) =~ "New jenis pengeluaran"
  end

  test "shows chosen resource", %{conn: conn} do
    jenis_pengeluaran = Repo.insert! %JenisPengeluaran{}
    conn = get conn, jenis_pengeluaran_path(conn, :show, jenis_pengeluaran)
    assert html_response(conn, 200) =~ "Show jenis pengeluaran"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, jenis_pengeluaran_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    jenis_pengeluaran = Repo.insert! %JenisPengeluaran{}
    conn = get conn, jenis_pengeluaran_path(conn, :edit, jenis_pengeluaran)
    assert html_response(conn, 200) =~ "Edit jenis pengeluaran"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    jenis_pengeluaran = Repo.insert! %JenisPengeluaran{}
    conn = put conn, jenis_pengeluaran_path(conn, :update, jenis_pengeluaran), jenis_pengeluaran: @valid_attrs
    assert redirected_to(conn) == jenis_pengeluaran_path(conn, :show, jenis_pengeluaran)
    assert Repo.get_by(JenisPengeluaran, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    jenis_pengeluaran = Repo.insert! %JenisPengeluaran{}
    conn = put conn, jenis_pengeluaran_path(conn, :update, jenis_pengeluaran), jenis_pengeluaran: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit jenis pengeluaran"
  end

  test "deletes chosen resource", %{conn: conn} do
    jenis_pengeluaran = Repo.insert! %JenisPengeluaran{}
    conn = delete conn, jenis_pengeluaran_path(conn, :delete, jenis_pengeluaran)
    assert redirected_to(conn) == jenis_pengeluaran_path(conn, :index)
    refute Repo.get(JenisPengeluaran, jenis_pengeluaran.id)
  end
end
