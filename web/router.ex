defmodule Simpawa.Router do
  use Simpawa.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Simpawa do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  resources "/anggota", AnggotaController
  resources "/simpananpokok", SimpananPokokController               # pemasukan simpanan pokok
  resources "/simpananwajib", SimpananWajibController               # pemasukan simpanan wajin
  resources "/simpanansukarela", SimpananSukarelaController         # pemasukan simpanan sukarela
  resources "/danasosial", DanaSosialController                     # pemasukan dana sosial
  resources "/lokasiarisan", LokasiArisanController
  resources "/danaarisan", DanaArisanController                     # pemasukan dana arisan
  resources "/jenispengeluaran", JenisPengeluaranController         # jenis pengeluaran koperasi (pinjaman, anggota berhenti, pengambilan simpanan sukarela)
  resources "/pengeluaran", PengeluaranController                   # pengeluaran koperasi
  resources "/pengeluaranarisan", PengeluaranArisanController       # pengeluaran arisan
  resources "/pengeluaransosial", PengeluaranSosialController       # pengeluaran dana sosial
  resources "/jenispemasukan", JenisPemasukanController             # jenis pemasukan dana koperasi (piutang, bunga, denda)

  # Other scopes may use custom stacks.
  # scope "/api", Simpawa do
  #   pipe_through :api
  # end
end
