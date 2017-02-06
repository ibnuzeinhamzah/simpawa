defmodule Simpawa.SimpananWajibControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.SimpananWajib
  @valid_attrs %{jumlah: "120.5", tanggal: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, simpanan_wajib_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing simpananwajib"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, simpanan_wajib_path(conn, :new)
    assert html_response(conn, 200) =~ "New simpanan wajib"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, simpanan_wajib_path(conn, :create), simpanan_wajib: @valid_attrs
    assert redirected_to(conn) == simpanan_wajib_path(conn, :index)
    assert Repo.get_by(SimpananWajib, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, simpanan_wajib_path(conn, :create), simpanan_wajib: @invalid_attrs
    assert html_response(conn, 200) =~ "New simpanan wajib"
  end

  test "shows chosen resource", %{conn: conn} do
    simpanan_wajib = Repo.insert! %SimpananWajib{}
    conn = get conn, simpanan_wajib_path(conn, :show, simpanan_wajib)
    assert html_response(conn, 200) =~ "Show simpanan wajib"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, simpanan_wajib_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    simpanan_wajib = Repo.insert! %SimpananWajib{}
    conn = get conn, simpanan_wajib_path(conn, :edit, simpanan_wajib)
    assert html_response(conn, 200) =~ "Edit simpanan wajib"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    simpanan_wajib = Repo.insert! %SimpananWajib{}
    conn = put conn, simpanan_wajib_path(conn, :update, simpanan_wajib), simpanan_wajib: @valid_attrs
    assert redirected_to(conn) == simpanan_wajib_path(conn, :show, simpanan_wajib)
    assert Repo.get_by(SimpananWajib, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    simpanan_wajib = Repo.insert! %SimpananWajib{}
    conn = put conn, simpanan_wajib_path(conn, :update, simpanan_wajib), simpanan_wajib: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit simpanan wajib"
  end

  test "deletes chosen resource", %{conn: conn} do
    simpanan_wajib = Repo.insert! %SimpananWajib{}
    conn = delete conn, simpanan_wajib_path(conn, :delete, simpanan_wajib)
    assert redirected_to(conn) == simpanan_wajib_path(conn, :index)
    refute Repo.get(SimpananWajib, simpanan_wajib.id)
  end
end
