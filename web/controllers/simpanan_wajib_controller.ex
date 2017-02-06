defmodule Simpawa.SimpananWajibController do
  use Simpawa.Web, :controller

  alias Simpawa.SimpananWajib

  def index(conn, _params) do
    simpananwajib = Repo.all(SimpananWajib)
    render(conn, "index.html", simpananwajib: simpananwajib)
  end

  def new(conn, _params) do
    changeset = SimpananWajib.changeset(%SimpananWajib{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"simpanan_wajib" => simpanan_wajib_params}) do
    changeset = SimpananWajib.changeset(%SimpananWajib{}, simpanan_wajib_params)

    case Repo.insert(changeset) do
      {:ok, _simpanan_wajib} ->
        conn
        |> put_flash(:info, "Simpanan wajib created successfully.")
        |> redirect(to: simpanan_wajib_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    simpanan_wajib = Repo.get!(SimpananWajib, id)
    render(conn, "show.html", simpanan_wajib: simpanan_wajib)
  end

  def edit(conn, %{"id" => id}) do
    simpanan_wajib = Repo.get!(SimpananWajib, id)
    changeset = SimpananWajib.changeset(simpanan_wajib)
    render(conn, "edit.html", simpanan_wajib: simpanan_wajib, changeset: changeset)
  end

  def update(conn, %{"id" => id, "simpanan_wajib" => simpanan_wajib_params}) do
    simpanan_wajib = Repo.get!(SimpananWajib, id)
    changeset = SimpananWajib.changeset(simpanan_wajib, simpanan_wajib_params)

    case Repo.update(changeset) do
      {:ok, simpanan_wajib} ->
        conn
        |> put_flash(:info, "Simpanan wajib updated successfully.")
        |> redirect(to: simpanan_wajib_path(conn, :show, simpanan_wajib))
      {:error, changeset} ->
        render(conn, "edit.html", simpanan_wajib: simpanan_wajib, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    simpanan_wajib = Repo.get!(SimpananWajib, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(simpanan_wajib)

    conn
    |> put_flash(:info, "Simpanan wajib deleted successfully.")
    |> redirect(to: simpanan_wajib_path(conn, :index))
  end
end
