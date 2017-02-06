defmodule Simpawa.SimpananPokokController do
  use Simpawa.Web, :controller

  alias Simpawa.SimpananPokok

  def index(conn, _params) do
    simpananpokok = Repo.all(SimpananPokok)
    render(conn, "index.html", simpananpokok: simpananpokok)
  end

  def new(conn, _params) do
    changeset = SimpananPokok.changeset(%SimpananPokok{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"simpanan_pokok" => simpanan_pokok_params}) do
    changeset = SimpananPokok.changeset(%SimpananPokok{}, simpanan_pokok_params)

    case Repo.insert(changeset) do
      {:ok, _simpanan_pokok} ->
        conn
        |> put_flash(:info, "Simpanan pokok created successfully.")
        |> redirect(to: simpanan_pokok_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    simpanan_pokok = Repo.get!(SimpananPokok, id)
    render(conn, "show.html", simpanan_pokok: simpanan_pokok)
  end

  def edit(conn, %{"id" => id}) do
    simpanan_pokok = Repo.get!(SimpananPokok, id)
    changeset = SimpananPokok.changeset(simpanan_pokok)
    render(conn, "edit.html", simpanan_pokok: simpanan_pokok, changeset: changeset)
  end

  def update(conn, %{"id" => id, "simpanan_pokok" => simpanan_pokok_params}) do
    simpanan_pokok = Repo.get!(SimpananPokok, id)
    changeset = SimpananPokok.changeset(simpanan_pokok, simpanan_pokok_params)

    case Repo.update(changeset) do
      {:ok, simpanan_pokok} ->
        conn
        |> put_flash(:info, "Simpanan pokok updated successfully.")
        |> redirect(to: simpanan_pokok_path(conn, :show, simpanan_pokok))
      {:error, changeset} ->
        render(conn, "edit.html", simpanan_pokok: simpanan_pokok, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    simpanan_pokok = Repo.get!(SimpananPokok, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(simpanan_pokok)

    conn
    |> put_flash(:info, "Simpanan pokok deleted successfully.")
    |> redirect(to: simpanan_pokok_path(conn, :index))
  end
end
