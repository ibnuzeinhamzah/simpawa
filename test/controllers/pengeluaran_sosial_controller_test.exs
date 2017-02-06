defmodule Simpawa.PengeluaranSosialControllerTest do
  use Simpawa.ConnCase

  alias Simpawa.PengeluaranSosial
  @valid_attrs %{jumlah: "120.5", keterangan: "some content", tanggal: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pengeluaran_sosial_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pengeluaransosial"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pengeluaran_sosial_path(conn, :new)
    assert html_response(conn, 200) =~ "New pengeluaran sosial"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pengeluaran_sosial_path(conn, :create), pengeluaran_sosial: @valid_attrs
    assert redirected_to(conn) == pengeluaran_sosial_path(conn, :index)
    assert Repo.get_by(PengeluaranSosial, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pengeluaran_sosial_path(conn, :create), pengeluaran_sosial: @invalid_attrs
    assert html_response(conn, 200) =~ "New pengeluaran sosial"
  end

  test "shows chosen resource", %{conn: conn} do
    pengeluaran_sosial = Repo.insert! %PengeluaranSosial{}
    conn = get conn, pengeluaran_sosial_path(conn, :show, pengeluaran_sosial)
    assert html_response(conn, 200) =~ "Show pengeluaran sosial"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pengeluaran_sosial_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pengeluaran_sosial = Repo.insert! %PengeluaranSosial{}
    conn = get conn, pengeluaran_sosial_path(conn, :edit, pengeluaran_sosial)
    assert html_response(conn, 200) =~ "Edit pengeluaran sosial"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pengeluaran_sosial = Repo.insert! %PengeluaranSosial{}
    conn = put conn, pengeluaran_sosial_path(conn, :update, pengeluaran_sosial), pengeluaran_sosial: @valid_attrs
    assert redirected_to(conn) == pengeluaran_sosial_path(conn, :show, pengeluaran_sosial)
    assert Repo.get_by(PengeluaranSosial, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pengeluaran_sosial = Repo.insert! %PengeluaranSosial{}
    conn = put conn, pengeluaran_sosial_path(conn, :update, pengeluaran_sosial), pengeluaran_sosial: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pengeluaran sosial"
  end

  test "deletes chosen resource", %{conn: conn} do
    pengeluaran_sosial = Repo.insert! %PengeluaranSosial{}
    conn = delete conn, pengeluaran_sosial_path(conn, :delete, pengeluaran_sosial)
    assert redirected_to(conn) == pengeluaran_sosial_path(conn, :index)
    refute Repo.get(PengeluaranSosial, pengeluaran_sosial.id)
  end
end
