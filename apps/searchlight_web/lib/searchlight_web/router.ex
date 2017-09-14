defmodule SearchlightWeb.Router do
  use SearchlightWeb, :router
  use Coherence.Router         # Add this

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Add this block
 scope "/", SearchlightWeb do
   pipe_through :browser
   coherence_routes()
 end

 # Add this block
 scope "/",  SearchlightWeb do
   pipe_through :protected
   coherence_routes :protected
 end

 scope "/", SearchlightWeb do
   pipe_through :browser


   # add public resources below
 end

 scope "/", SearchlightWeb do
   pipe_through :protected

   # add protected resources below
    resources "/dashboards", DashboardController
    resources "/bots", BotController
    resources "/bot_types", BotTypeController
    resources "/users", UserController
    resources "/accounts", AccountController
    resources "/devices", DeviceController


    # Test Concerns

    resources "/test_types", TestTypeController
    resources "/tests", TestController

    get "/", DashboardController, :index
    put "/lock/:id", UserController, :lock
    put "/unlock/:id", UserController, :unlock
    put "/confirm/:id", UserController, :confirm
 end

  # Other scopes may use custom stacks.
  # scope "/api", SearchlightWeb do
  #   pipe_through :api
  # end
end
