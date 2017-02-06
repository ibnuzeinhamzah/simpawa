defmodule Simpawa.PengeluaranArisanController do
  use Simpawa.Web, :controller

  alias Simpawa.PengeluaranArisan

  def index(conn, _params) do
    pengeluaranarisan = Repo.all(PengeluaranArisan)
    render(conn, "index.html", pengeluaranarisan: pengeluaranarisan)
  end

  def new(conn, _params) do
    changeset = PengeluaranArisan.changeset(%PengeluaranArisan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pengeluaran_arisan" => pengeluaran_arisan_params}) do
    changeset = PengeluaranArisan.changeset(%PengeluaranArisan{}, pengeluaran_arisan_params)

    case Repo.insert(changeset) do
      {:ok, _pengeluaran_arisan} ->
        conn
        |> put_flash(:info, "Pengeluaran arisan created successfully.")
        |> redirect(to: pengeluaran_arisan_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pengeluaran_arisan = Repo.get!(PengeluaranArisan, id)
    render(conn, "show.html", pengeluaran_arisan: pengeluaran_arisan)
  end

  def edit(conn, %{"id" => id}) do
    pengeluaran_arisan = Repo.get!(PengeluaranArisan, id)
    changeset = PengeluaranArisan.changeset(pengeluaran_arisan)
    render(conn, "edit.html", pengeluaran_arisan: pengeluaran_arisan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pengeluaran_arisan" => pengeluaran_arisan_params}) do
    pengeluaran_arisan = Repo.get!(PengeluaranArisan, id)
    changeset = PengeluaranArisan.changeset(pengeluaran_arisan, pengeluaran_arisan_params)

    case Repo.update(changeset) do
      {:ok, pengeluaran_arisan} ->
        conn
        |> put_flash(:info, "Pengeluaran arisan updated successfully.")
        |> redirect(to: pengeluaran_arisan_path(conn, :show, pengeluaran_arisan))
      {:error, changeset} ->
        render(conn, "edit.html", pengeluaran_arisan: pengeluaran_arisan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pengeluaran_arisan = Repo.get!(PengeluaranArisan, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pengeluaran_arisan)

    conn
    |> put_flash(:info, "Pengeluaran arisan deleted successfully.")
    |> redirect(to: pengeluaran_arisan_path(conn, :index))
  end
end
