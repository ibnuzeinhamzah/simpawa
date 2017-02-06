defmodule Simpawa.JenisPengeluaranController do
  use Simpawa.Web, :controller

  alias Simpawa.JenisPengeluaran

  def index(conn, _params) do
    jenispengeluaran = Repo.all(JenisPengeluaran)
    render(conn, "index.html", jenispengeluaran: jenispengeluaran)
  end

  def new(conn, _params) do
    changeset = JenisPengeluaran.changeset(%JenisPengeluaran{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"jenis_pengeluaran" => jenis_pengeluaran_params}) do
    changeset = JenisPengeluaran.changeset(%JenisPengeluaran{}, jenis_pengeluaran_params)

    case Repo.insert(changeset) do
      {:ok, _jenis_pengeluaran} ->
        conn
        |> put_flash(:info, "Jenis pengeluaran created successfully.")
        |> redirect(to: jenis_pengeluaran_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    jenis_pengeluaran = Repo.get!(JenisPengeluaran, id)
    render(conn, "show.html", jenis_pengeluaran: jenis_pengeluaran)
  end

  def edit(conn, %{"id" => id}) do
    jenis_pengeluaran = Repo.get!(JenisPengeluaran, id)
    changeset = JenisPengeluaran.changeset(jenis_pengeluaran)
    render(conn, "edit.html", jenis_pengeluaran: jenis_pengeluaran, changeset: changeset)
  end

  def update(conn, %{"id" => id, "jenis_pengeluaran" => jenis_pengeluaran_params}) do
    jenis_pengeluaran = Repo.get!(JenisPengeluaran, id)
    changeset = JenisPengeluaran.changeset(jenis_pengeluaran, jenis_pengeluaran_params)

    case Repo.update(changeset) do
      {:ok, jenis_pengeluaran} ->
        conn
        |> put_flash(:info, "Jenis pengeluaran updated successfully.")
        |> redirect(to: jenis_pengeluaran_path(conn, :show, jenis_pengeluaran))
      {:error, changeset} ->
        render(conn, "edit.html", jenis_pengeluaran: jenis_pengeluaran, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    jenis_pengeluaran = Repo.get!(JenisPengeluaran, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(jenis_pengeluaran)

    conn
    |> put_flash(:info, "Jenis pengeluaran deleted successfully.")
    |> redirect(to: jenis_pengeluaran_path(conn, :index))
  end
end
