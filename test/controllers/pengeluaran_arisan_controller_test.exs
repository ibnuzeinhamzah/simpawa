defmodule Simpawa.PengeluaranArisanControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.PengeluaranArisan
  @valid_attrs %{jumlah: "120.5", keterangan: "some content", tanggal: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pengeluaran_arisan_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pengeluaranarisan"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pengeluaran_arisan_path(conn, :new)
    assert html_response(conn, 200) =~ "New pengeluaran arisan"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pengeluaran_arisan_path(conn, :create), pengeluaran_arisan: @valid_attrs
    assert redirected_to(conn) == pengeluaran_arisan_path(conn, :index)
    assert Repo.get_by(PengeluaranArisan, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pengeluaran_arisan_path(conn, :create), pengeluaran_arisan: @invalid_attrs
    assert html_response(conn, 200) =~ "New pengeluaran arisan"
  end

  test "shows chosen resource", %{conn: conn} do
    pengeluaran_arisan = Repo.insert! %PengeluaranArisan{}
    conn = get conn, pengeluaran_arisan_path(conn, :show, pengeluaran_arisan)
    assert html_response(conn, 200) =~ "Show pengeluaran arisan"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pengeluaran_arisan_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pengeluaran_arisan = Repo.insert! %PengeluaranArisan{}
    conn = get conn, pengeluaran_arisan_path(conn, :edit, pengeluaran_arisan)
    assert html_response(conn, 200) =~ "Edit pengeluaran arisan"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pengeluaran_arisan = Repo.insert! %PengeluaranArisan{}
    conn = put conn, pengeluaran_arisan_path(conn, :update, pengeluaran_arisan), pengeluaran_arisan: @valid_attrs
    assert redirected_to(conn) == pengeluaran_arisan_path(conn, :show, pengeluaran_arisan)
    assert Repo.get_by(PengeluaranArisan, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pengeluaran_arisan = Repo.insert! %PengeluaranArisan{}
    conn = put conn, pengeluaran_arisan_path(conn, :update, pengeluaran_arisan), pengeluaran_arisan: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pengeluaran arisan"
  end

  test "deletes chosen resource", %{conn: conn} do
    pengeluaran_arisan = Repo.insert! %PengeluaranArisan{}
    conn = delete conn, pengeluaran_arisan_path(conn, :delete, pengeluaran_arisan)
    assert redirected_to(conn) == pengeluaran_arisan_path(conn, :index)
    refute Repo.get(PengeluaranArisan, pengeluaran_arisan.id)
  end
end
