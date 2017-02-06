defmodule Simpawa.AnggotaControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.Anggota
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, anggota_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing anggota"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, anggota_path(conn, :new)
    assert html_response(conn, 200) =~ "New anggota"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, anggota_path(conn, :create), anggota: @valid_attrs
    assert redirected_to(conn) == anggota_path(conn, :index)
    assert Repo.get_by(Anggota, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, anggota_path(conn, :create), anggota: @invalid_attrs
    assert html_response(conn, 200) =~ "New anggota"
  end

  test "shows chosen resource", %{conn: conn} do
    anggota = Repo.insert! %Anggota{}
    conn = get conn, anggota_path(conn, :show, anggota)
    assert html_response(conn, 200) =~ "Show anggota"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, anggota_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    anggota = Repo.insert! %Anggota{}
    conn = get conn, anggota_path(conn, :edit, anggota)
    assert html_response(conn, 200) =~ "Edit anggota"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    anggota = Repo.insert! %Anggota{}
    conn = put conn, anggota_path(conn, :update, anggota), anggota: @valid_attrs
    assert redirected_to(conn) == anggota_path(conn, :show, anggota)
    assert Repo.get_by(Anggota, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    anggota = Repo.insert! %Anggota{}
    conn = put conn, anggota_path(conn, :update, anggota), anggota: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit anggota"
  end

  test "deletes chosen resource", %{conn: conn} do
    anggota = Repo.insert! %Anggota{}
    conn = delete conn, anggota_path(conn, :delete, anggota)
    assert redirected_to(conn) == anggota_path(conn, :index)
    refute Repo.get(Anggota, anggota.id)
  end
end
