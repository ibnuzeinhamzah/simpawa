defmodule Simpawa.PemasukanController do
  use Simpawa.Web, :controller

  alias Simpawa.Pemasukan

  def index(conn, _params) do
    pemasukan = Repo.all(Pemasukan)
    render(conn, "index.html", pemasukan: pemasukan)
  end

  def new(conn, _params) do
    changeset = Pemasukan.changeset(%Pemasukan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pemasukan" => pemasukan_params}) do
    changeset = Pemasukan.changeset(%Pemasukan{}, pemasukan_params)

    case Repo.insert(changeset) do
      {:ok, _pemasukan} ->
        conn
        |> put_flash(:info, "Pemasukan created successfully.")
        |> redirect(to: pemasukan_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pemasukan = Repo.get!(Pemasukan, id)
    render(conn, "show.html", pemasukan: pemasukan)
  end

  def edit(conn, %{"id" => id}) do
    pemasukan = Repo.get!(Pemasukan, id)
    changeset = Pemasukan.changeset(pemasukan)
    render(conn, "edit.html", pemasukan: pemasukan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pemasukan" => pemasukan_params}) do
    pemasukan = Repo.get!(Pemasukan, id)
    changeset = Pemasukan.changeset(pemasukan, pemasukan_params)

    case Repo.update(changeset) do
      {:ok, pemasukan} ->
        conn
        |> put_flash(:info, "Pemasukan updated successfully.")
        |> redirect(to: pemasukan_path(conn, :show, pemasukan))
      {:error, changeset} ->
        render(conn, "edit.html", pemasukan: pemasukan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pemasukan = Repo.get!(Pemasukan, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pemasukan)

    conn
    |> put_flash(:info, "Pemasukan deleted successfully.")
    |> redirect(to: pemasukan_path(conn, :index))
  end
end
