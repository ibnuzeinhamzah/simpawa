defmodule Simpawa.LokasiArisanController do
  use Simpawa.Web, :controller

  alias Simpawa.LokasiArisan

  def index(conn, _params) do
    lokasiarisan = Repo.all(LokasiArisan)
    render(conn, "index.html", lokasiarisan: lokasiarisan)
  end

  def new(conn, _params) do
    changeset = LokasiArisan.changeset(%LokasiArisan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lokasi_arisan" => lokasi_arisan_params}) do
    changeset = LokasiArisan.changeset(%LokasiArisan{}, lokasi_arisan_params)

    case Repo.insert(changeset) do
      {:ok, _lokasi_arisan} ->
        conn
        |> put_flash(:info, "Lokasi arisan created successfully.")
        |> redirect(to: lokasi_arisan_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lokasi_arisan = Repo.get!(LokasiArisan, id)
    render(conn, "show.html", lokasi_arisan: lokasi_arisan)
  end

  def edit(conn, %{"id" => id}) do
    lokasi_arisan = Repo.get!(LokasiArisan, id)
    changeset = LokasiArisan.changeset(lokasi_arisan)
    render(conn, "edit.html", lokasi_arisan: lokasi_arisan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lokasi_arisan" => lokasi_arisan_params}) do
    lokasi_arisan = Repo.get!(LokasiArisan, id)
    changeset = LokasiArisan.changeset(lokasi_arisan, lokasi_arisan_params)

    case Repo.update(changeset) do
      {:ok, lokasi_arisan} ->
        conn
        |> put_flash(:info, "Lokasi arisan updated successfully.")
        |> redirect(to: lokasi_arisan_path(conn, :show, lokasi_arisan))
      {:error, changeset} ->
        render(conn, "edit.html", lokasi_arisan: lokasi_arisan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lokasi_arisan = Repo.get!(LokasiArisan, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(lokasi_arisan)

    conn
    |> put_flash(:info, "Lokasi arisan deleted successfully.")
    |> redirect(to: lokasi_arisan_path(conn, :index))
  end
end
