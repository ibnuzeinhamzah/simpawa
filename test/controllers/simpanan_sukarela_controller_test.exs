defmodule Simpawa.SimpananSukarelaControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.SimpananSukarela
  @valid_attrs %{jumlah: "120.5", tanggal: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, simpanan_sukarela_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing simpanansukarela"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, simpanan_sukarela_path(conn, :new)
    assert html_response(conn, 200) =~ "New simpanan sukarela"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, simpanan_sukarela_path(conn, :create), simpanan_sukarela: @valid_attrs
    assert redirected_to(conn) == simpanan_sukarela_path(conn, :index)
    assert Repo.get_by(SimpananSukarela, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, simpanan_sukarela_path(conn, :create), simpanan_sukarela: @invalid_attrs
    assert html_response(conn, 200) =~ "New simpanan sukarela"
  end

  test "shows chosen resource", %{conn: conn} do
    simpanan_sukarela = Repo.insert! %SimpananSukarela{}
    conn = get conn, simpanan_sukarela_path(conn, :show, simpanan_sukarela)
    assert html_response(conn, 200) =~ "Show simpanan sukarela"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, simpanan_sukarela_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    simpanan_sukarela = Repo.insert! %SimpananSukarela{}
    conn = get conn, simpanan_sukarela_path(conn, :edit, simpanan_sukarela)
    assert html_response(conn, 200) =~ "Edit simpanan sukarela"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    simpanan_sukarela = Repo.insert! %SimpananSukarela{}
    conn = put conn, simpanan_sukarela_path(conn, :update, simpanan_sukarela), simpanan_sukarela: @valid_attrs
    assert redirected_to(conn) == simpanan_sukarela_path(conn, :show, simpanan_sukarela)
    assert Repo.get_by(SimpananSukarela, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    simpanan_sukarela = Repo.insert! %SimpananSukarela{}
    conn = put conn, simpanan_sukarela_path(conn, :update, simpanan_sukarela), simpanan_sukarela: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit simpanan sukarela"
  end

  test "deletes chosen resource", %{conn: conn} do
    simpanan_sukarela = Repo.insert! %SimpananSukarela{}
    conn = delete conn, simpanan_sukarela_path(conn, :delete, simpanan_sukarela)
    assert redirected_to(conn) == simpanan_sukarela_path(conn, :index)
    refute Repo.get(SimpananSukarela, simpanan_sukarela.id)
  end
end
