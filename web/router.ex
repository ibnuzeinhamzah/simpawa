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

    resources "/anggota", AnggotaController
    resources "/simpananpokok", SimpananPokokController               # pemasukan simpanan pokok
    
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Simpawa do
  #   pipe_through :api
  # end
end
