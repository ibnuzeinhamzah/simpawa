defmodule Simpawa.PengeluaranController do
  use Simpawa.Web, :controller

  alias Simpawa.Pengeluaran

  def index(conn, _params) do
    pengeluaran = Repo.all(Pengeluaran)
    render(conn, "index.html", pengeluaran: pengeluaran)
  end

  def new(conn, _params) do
    changeset = Pengeluaran.changeset(%Pengeluaran{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pengeluaran" => pengeluaran_params}) do
    changeset = Pengeluaran.changeset(%Pengeluaran{}, pengeluaran_params)

    case Repo.insert(changeset) do
      {:ok, _pengeluaran} ->
        conn
        |> put_flash(:info, "Pengeluaran created successfully.")
        |> redirect(to: pengeluaran_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pengeluaran = Repo.get!(Pengeluaran, id)
    render(conn, "show.html", pengeluaran: pengeluaran)
  end

  def edit(conn, %{"id" => id}) do
    pengeluaran = Repo.get!(Pengeluaran, id)
    changeset = Pengeluaran.changeset(pengeluaran)
    render(conn, "edit.html", pengeluaran: pengeluaran, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pengeluaran" => pengeluaran_params}) do
    pengeluaran = Repo.get!(Pengeluaran, id)
    changeset = Pengeluaran.changeset(pengeluaran, pengeluaran_params)

    case Repo.update(changeset) do
      {:ok, pengeluaran} ->
        conn
        |> put_flash(:info, "Pengeluaran updated successfully.")
        |> redirect(to: pengeluaran_path(conn, :show, pengeluaran))
      {:error, changeset} ->
        render(conn, "edit.html", pengeluaran: pengeluaran, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pengeluaran = Repo.get!(Pengeluaran, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pengeluaran)

    conn
    |> put_flash(:info, "Pengeluaran deleted successfully.")
    |> redirect(to: pengeluaran_path(conn, :index))
  end
end
