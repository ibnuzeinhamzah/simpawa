defmodule Simpawa.PengeluaranSosialController do
  use Simpawa.Web, :controller

  alias Simpawa.PengeluaranSosial

  def index(conn, _params) do
    pengeluaransosial = Repo.all(PengeluaranSosial)
    render(conn, "index.html", pengeluaransosial: pengeluaransosial)
  end

  def new(conn, _params) do
    changeset = PengeluaranSosial.changeset(%PengeluaranSosial{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pengeluaran_sosial" => pengeluaran_sosial_params}) do
    changeset = PengeluaranSosial.changeset(%PengeluaranSosial{}, pengeluaran_sosial_params)

    case Repo.insert(changeset) do
      {:ok, _pengeluaran_sosial} ->
        conn
        |> put_flash(:info, "Pengeluaran sosial created successfully.")
        |> redirect(to: pengeluaran_sosial_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pengeluaran_sosial = Repo.get!(PengeluaranSosial, id)
    render(conn, "show.html", pengeluaran_sosial: pengeluaran_sosial)
  end

  def edit(conn, %{"id" => id}) do
    pengeluaran_sosial = Repo.get!(PengeluaranSosial, id)
    changeset = PengeluaranSosial.changeset(pengeluaran_sosial)
    render(conn, "edit.html", pengeluaran_sosial: pengeluaran_sosial, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pengeluaran_sosial" => pengeluaran_sosial_params}) do
    pengeluaran_sosial = Repo.get!(PengeluaranSosial, id)
    changeset = PengeluaranSosial.changeset(pengeluaran_sosial, pengeluaran_sosial_params)

    case Repo.update(changeset) do
      {:ok, pengeluaran_sosial} ->
        conn
        |> put_flash(:info, "Pengeluaran sosial updated successfully.")
        |> redirect(to: pengeluaran_sosial_path(conn, :show, pengeluaran_sosial))
      {:error, changeset} ->
        render(conn, "edit.html", pengeluaran_sosial: pengeluaran_sosial, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pengeluaran_sosial = Repo.get!(PengeluaranSosial, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pengeluaran_sosial)

    conn
    |> put_flash(:info, "Pengeluaran sosial deleted successfully.")
    |> redirect(to: pengeluaran_sosial_path(conn, :index))
  end
end
