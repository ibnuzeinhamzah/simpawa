defmodule Simpawa.JenisPemasukanController do
  use Simpawa.Web, :controller

  alias Simpawa.JenisPemasukan

  def index(conn, _params) do
    jenispemasukan = Repo.all(JenisPemasukan)
    render(conn, "index.html", jenispemasukan: jenispemasukan)
  end

  def new(conn, _params) do
    changeset = JenisPemasukan.changeset(%JenisPemasukan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"jenis_pemasukan" => jenis_pemasukan_params}) do
    changeset = JenisPemasukan.changeset(%JenisPemasukan{}, jenis_pemasukan_params)

    case Repo.insert(changeset) do
      {:ok, _jenis_pemasukan} ->
        conn
        |> put_flash(:info, "Jenis pemasukan created successfully.")
        |> redirect(to: jenis_pemasukan_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    jenis_pemasukan = Repo.get!(JenisPemasukan, id)
    render(conn, "show.html", jenis_pemasukan: jenis_pemasukan)
  end

  def edit(conn, %{"id" => id}) do
    jenis_pemasukan = Repo.get!(JenisPemasukan, id)
    changeset = JenisPemasukan.changeset(jenis_pemasukan)
    render(conn, "edit.html", jenis_pemasukan: jenis_pemasukan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "jenis_pemasukan" => jenis_pemasukan_params}) do
    jenis_pemasukan = Repo.get!(JenisPemasukan, id)
    changeset = JenisPemasukan.changeset(jenis_pemasukan, jenis_pemasukan_params)

    case Repo.update(changeset) do
      {:ok, jenis_pemasukan} ->
        conn
        |> put_flash(:info, "Jenis pemasukan updated successfully.")
        |> redirect(to: jenis_pemasukan_path(conn, :show, jenis_pemasukan))
      {:error, changeset} ->
        render(conn, "edit.html", jenis_pemasukan: jenis_pemasukan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    jenis_pemasukan = Repo.get!(JenisPemasukan, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(jenis_pemasukan)

    conn
    |> put_flash(:info, "Jenis pemasukan deleted successfully.")
    |> redirect(to: jenis_pemasukan_path(conn, :index))
  end
end
