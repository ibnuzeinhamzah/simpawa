defmodule Simpawa.PengeluaranControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.Pengeluaran
  @valid_attrs %{jumlah: "120.5", keterangan: "some content", tanggal: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pengeluaran_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pengeluaran"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pengeluaran_path(conn, :new)
    assert html_response(conn, 200) =~ "New pengeluaran"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pengeluaran_path(conn, :create), pengeluaran: @valid_attrs
    assert redirected_to(conn) == pengeluaran_path(conn, :index)
    assert Repo.get_by(Pengeluaran, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pengeluaran_path(conn, :create), pengeluaran: @invalid_attrs
    assert html_response(conn, 200) =~ "New pengeluaran"
  end

  test "shows chosen resource", %{conn: conn} do
    pengeluaran = Repo.insert! %Pengeluaran{}
    conn = get conn, pengeluaran_path(conn, :show, pengeluaran)
    assert html_response(conn, 200) =~ "Show pengeluaran"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pengeluaran_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pengeluaran = Repo.insert! %Pengeluaran{}
    conn = get conn, pengeluaran_path(conn, :edit, pengeluaran)
    assert html_response(conn, 200) =~ "Edit pengeluaran"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pengeluaran = Repo.insert! %Pengeluaran{}
    conn = put conn, pengeluaran_path(conn, :update, pengeluaran), pengeluaran: @valid_attrs
    assert redirected_to(conn) == pengeluaran_path(conn, :show, pengeluaran)
    assert Repo.get_by(Pengeluaran, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pengeluaran = Repo.insert! %Pengeluaran{}
    conn = put conn, pengeluaran_path(conn, :update, pengeluaran), pengeluaran: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pengeluaran"
  end

  test "deletes chosen resource", %{conn: conn} do
    pengeluaran = Repo.insert! %Pengeluaran{}
    conn = delete conn, pengeluaran_path(conn, :delete, pengeluaran)
    assert redirected_to(conn) == pengeluaran_path(conn, :index)
    refute Repo.get(Pengeluaran, pengeluaran.id)
  end
end
