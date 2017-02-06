defmodule Simpawa.DanaSosialController do
  use Simpawa.Web, :controller

  alias Simpawa.DanaSosial

  def index(conn, _params) do
    danasosial = Repo.all(DanaSosial)
    render(conn, "index.html", danasosial: danasosial)
  end

  def new(conn, _params) do
    changeset = DanaSosial.changeset(%DanaSosial{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dana_sosial" => dana_sosial_params}) do
    changeset = DanaSosial.changeset(%DanaSosial{}, dana_sosial_params)

    case Repo.insert(changeset) do
      {:ok, _dana_sosial} ->
        conn
        |> put_flash(:info, "Dana sosial created successfully.")
        |> redirect(to: dana_sosial_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dana_sosial = Repo.get!(DanaSosial, id)
    render(conn, "show.html", dana_sosial: dana_sosial)
  end

  def edit(conn, %{"id" => id}) do
    dana_sosial = Repo.get!(DanaSosial, id)
    changeset = DanaSosial.changeset(dana_sosial)
    render(conn, "edit.html", dana_sosial: dana_sosial, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dana_sosial" => dana_sosial_params}) do
    dana_sosial = Repo.get!(DanaSosial, id)
    changeset = DanaSosial.changeset(dana_sosial, dana_sosial_params)

    case Repo.update(changeset) do
      {:ok, dana_sosial} ->
        conn
        |> put_flash(:info, "Dana sosial updated successfully.")
        |> redirect(to: dana_sosial_path(conn, :show, dana_sosial))
      {:error, changeset} ->
        render(conn, "edit.html", dana_sosial: dana_sosial, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dana_sosial = Repo.get!(DanaSosial, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(dana_sosial)

    conn
    |> put_flash(:info, "Dana sosial deleted successfully.")
    |> redirect(to: dana_sosial_path(conn, :index))
  end
end
