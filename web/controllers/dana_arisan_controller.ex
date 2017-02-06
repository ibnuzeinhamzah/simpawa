defmodule Simpawa.DanaArisanController do
  use Simpawa.Web, :controller

  alias Simpawa.DanaArisan

  def index(conn, _params) do
    danaarisan = Repo.all(DanaArisan)
    render(conn, "index.html", danaarisan: danaarisan)
  end

  def new(conn, _params) do
    changeset = DanaArisan.changeset(%DanaArisan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dana_arisan" => dana_arisan_params}) do
    changeset = DanaArisan.changeset(%DanaArisan{}, dana_arisan_params)

    case Repo.insert(changeset) do
      {:ok, _dana_arisan} ->
        conn
        |> put_flash(:info, "Dana arisan created successfully.")
        |> redirect(to: dana_arisan_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dana_arisan = Repo.get!(DanaArisan, id)
    render(conn, "show.html", dana_arisan: dana_arisan)
  end

  def edit(conn, %{"id" => id}) do
    dana_arisan = Repo.get!(DanaArisan, id)
    changeset = DanaArisan.changeset(dana_arisan)
    render(conn, "edit.html", dana_arisan: dana_arisan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dana_arisan" => dana_arisan_params}) do
    dana_arisan = Repo.get!(DanaArisan, id)
    changeset = DanaArisan.changeset(dana_arisan, dana_arisan_params)

    case Repo.update(changeset) do
      {:ok, dana_arisan} ->
        conn
        |> put_flash(:info, "Dana arisan updated successfully.")
        |> redirect(to: dana_arisan_path(conn, :show, dana_arisan))
      {:error, changeset} ->
        render(conn, "edit.html", dana_arisan: dana_arisan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dana_arisan = Repo.get!(DanaArisan, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(dana_arisan)

    conn
    |> put_flash(:info, "Dana arisan deleted successfully.")
    |> redirect(to: dana_arisan_path(conn, :index))
  end
end
