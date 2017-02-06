defmodule Simpawa.AnggotaController do
  use Simpawa.Web, :controller

  alias Simpawa.Anggota

  def index(conn, _params) do
    anggota = Repo.all(Anggota)
    render(conn, "index.html", anggota: anggota)
  end

  def new(conn, _params) do
    changeset = Anggota.changeset(%Anggota{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"anggota" => anggota_params}) do
    changeset = Anggota.changeset(%Anggota{}, anggota_params)

    case Repo.insert(changeset) do
      {:ok, _anggota} ->
        conn
        |> put_flash(:info, "Anggota created successfully.")
        |> redirect(to: anggota_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    anggota = Repo.get!(Anggota, id)
    render(conn, "show.html", anggota: anggota)
  end

  def edit(conn, %{"id" => id}) do
    anggota = Repo.get!(Anggota, id)
    changeset = Anggota.changeset(anggota)
    render(conn, "edit.html", anggota: anggota, changeset: changeset)
  end

  def update(conn, %{"id" => id, "anggota" => anggota_params}) do
    anggota = Repo.get!(Anggota, id)
    changeset = Anggota.changeset(anggota, anggota_params)

    case Repo.update(changeset) do
      {:ok, anggota} ->
        conn
        |> put_flash(:info, "Anggota updated successfully.")
        |> redirect(to: anggota_path(conn, :show, anggota))
      {:error, changeset} ->
        render(conn, "edit.html", anggota: anggota, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    anggota = Repo.get!(Anggota, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(anggota)

    conn
    |> put_flash(:info, "Anggota deleted successfully.")
    |> redirect(to: anggota_path(conn, :index))
  end
end
