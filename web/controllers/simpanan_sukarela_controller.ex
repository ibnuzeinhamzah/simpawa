defmodule Simpawa.SimpananSukarelaController do
  use Simpawa.Web, :controller

  alias Simpawa.SimpananSukarela

  def index(conn, _params) do
    simpanansukarela = Repo.all(SimpananSukarela)
    render(conn, "index.html", simpanansukarela: simpanansukarela)
  end

  def new(conn, _params) do
    changeset = SimpananSukarela.changeset(%SimpananSukarela{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"simpanan_sukarela" => simpanan_sukarela_params}) do
    changeset = SimpananSukarela.changeset(%SimpananSukarela{}, simpanan_sukarela_params)

    case Repo.insert(changeset) do
      {:ok, _simpanan_sukarela} ->
        conn
        |> put_flash(:info, "Simpanan sukarela created successfully.")
        |> redirect(to: simpanan_sukarela_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    simpanan_sukarela = Repo.get!(SimpananSukarela, id)
    render(conn, "show.html", simpanan_sukarela: simpanan_sukarela)
  end

  def edit(conn, %{"id" => id}) do
    simpanan_sukarela = Repo.get!(SimpananSukarela, id)
    changeset = SimpananSukarela.changeset(simpanan_sukarela)
    render(conn, "edit.html", simpanan_sukarela: simpanan_sukarela, changeset: changeset)
  end

  def update(conn, %{"id" => id, "simpanan_sukarela" => simpanan_sukarela_params}) do
    simpanan_sukarela = Repo.get!(SimpananSukarela, id)
    changeset = SimpananSukarela.changeset(simpanan_sukarela, simpanan_sukarela_params)

    case Repo.update(changeset) do
      {:ok, simpanan_sukarela} ->
        conn
        |> put_flash(:info, "Simpanan sukarela updated successfully.")
        |> redirect(to: simpanan_sukarela_path(conn, :show, simpanan_sukarela))
      {:error, changeset} ->
        render(conn, "edit.html", simpanan_sukarela: simpanan_sukarela, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    simpanan_sukarela = Repo.get!(SimpananSukarela, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(simpanan_sukarela)

    conn
    |> put_flash(:info, "Simpanan sukarela deleted successfully.")
    |> redirect(to: simpanan_sukarela_path(conn, :index))
  end
end
