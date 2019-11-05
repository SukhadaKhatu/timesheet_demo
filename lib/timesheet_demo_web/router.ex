defmodule TimesheetDemoWeb.Router do
  use TimesheetDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TimesheetDemoWeb.Plugs.FetchCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimesheetDemoWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController
    resources "/tasks", TaskController
    resources "/requests", RequestController
    resources "/sessions", SessionController,
      only: [:new, :create, :delete], singleton: true

  end

end
