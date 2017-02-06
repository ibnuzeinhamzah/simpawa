defmodule Simpawa.PemasukanControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.Pemasukan
  @valid_attrs %{jumlah: "120.5", keterangan: "some content", tanggal: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pemasukan_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pemasukan"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pemasukan_path(conn, :new)
    assert html_response(conn, 200) =~ "New pemasukan"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pemasukan_path(conn, :create), pemasukan: @valid_attrs
    assert redirected_to(conn) == pemasukan_path(conn, :index)
    assert Repo.get_by(Pemasukan, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pemasukan_path(conn, :create), pemasukan: @invalid_attrs
    assert html_response(conn, 200) =~ "New pemasukan"
  end

  test "shows chosen resource", %{conn: conn} do
    pemasukan = Repo.insert! %Pemasukan{}
    conn = get conn, pemasukan_path(conn, :show, pemasukan)
    assert html_response(conn, 200) =~ "Show pemasukan"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pemasukan_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pemasukan = Repo.insert! %Pemasukan{}
    conn = get conn, pemasukan_path(conn, :edit, pemasukan)
    assert html_response(conn, 200) =~ "Edit pemasukan"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pemasukan = Repo.insert! %Pemasukan{}
    conn = put conn, pemasukan_path(conn, :update, pemasukan), pemasukan: @valid_attrs
    assert redirected_to(conn) == pemasukan_path(conn, :show, pemasukan)
    assert Repo.get_by(Pemasukan, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pemasukan = Repo.insert! %Pemasukan{}
    conn = put conn, pemasukan_path(conn, :update, pemasukan), pemasukan: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pemasukan"
  end

  test "deletes chosen resource", %{conn: conn} do
    pemasukan = Repo.insert! %Pemasukan{}
    conn = delete conn, pemasukan_path(conn, :delete, pemasukan)
    assert redirected_to(conn) == pemasukan_path(conn, :index)
    refute Repo.get(Pemasukan, pemasukan.id)
  end
end
