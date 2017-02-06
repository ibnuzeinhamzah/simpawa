defmodule Simpawa.DanaArisanControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.DanaArisan
  @valid_attrs %{jumlah: "120.5"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, dana_arisan_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing danaarisan"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, dana_arisan_path(conn, :new)
    assert html_response(conn, 200) =~ "New dana arisan"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, dana_arisan_path(conn, :create), dana_arisan: @valid_attrs
    assert redirected_to(conn) == dana_arisan_path(conn, :index)
    assert Repo.get_by(DanaArisan, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dana_arisan_path(conn, :create), dana_arisan: @invalid_attrs
    assert html_response(conn, 200) =~ "New dana arisan"
  end

  test "shows chosen resource", %{conn: conn} do
    dana_arisan = Repo.insert! %DanaArisan{}
    conn = get conn, dana_arisan_path(conn, :show, dana_arisan)
    assert html_response(conn, 200) =~ "Show dana arisan"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, dana_arisan_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    dana_arisan = Repo.insert! %DanaArisan{}
    conn = get conn, dana_arisan_path(conn, :edit, dana_arisan)
    assert html_response(conn, 200) =~ "Edit dana arisan"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    dana_arisan = Repo.insert! %DanaArisan{}
    conn = put conn, dana_arisan_path(conn, :update, dana_arisan), dana_arisan: @valid_attrs
    assert redirected_to(conn) == dana_arisan_path(conn, :show, dana_arisan)
    assert Repo.get_by(DanaArisan, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    dana_arisan = Repo.insert! %DanaArisan{}
    conn = put conn, dana_arisan_path(conn, :update, dana_arisan), dana_arisan: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit dana arisan"
  end

  test "deletes chosen resource", %{conn: conn} do
    dana_arisan = Repo.insert! %DanaArisan{}
    conn = delete conn, dana_arisan_path(conn, :delete, dana_arisan)
    assert redirected_to(conn) == dana_arisan_path(conn, :index)
    refute Repo.get(DanaArisan, dana_arisan.id)
  end
end
