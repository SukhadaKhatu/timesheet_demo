defmodule TimesheetDemoWeb.SessionController do
    use TimesheetDemoWeb, :controller
  
    def new(conn, _params) do
      render(conn, "new.html")
    end
  
    def create(conn, %{"email" => email, "password" => password}) do
        user = TimesheetDemo.Users.authenticate(email, password)
        IO.inspect(user)
        IO.inspect(user.manager)
        if user.manager == nil do
            if user do
                conn
                |> put_session(:user_id, user.id)
                |> put_flash(:info, "Welcome back #{user.name}")
                |> redirect(to: Routes.request_path(conn, :index))
              else
                conn
                |> put_flash(:error, "Login failed.")
                |> redirect(to: Routes.page_path(conn, :index))
              end 
        else
            if user do
                conn
                |> put_session(:user_id, user.id)
                |> put_flash(:info, "Welcome back #{user.name}")
                |> redirect(to: Routes.task_path(conn, :index))
              else
                conn
                |> put_flash(:error, "Login failed.")
                |> redirect(to: Routes.page_path(conn, :index))
              end
        end
    end
  
    def delete(conn, _params) do
      conn
      |> delete_session(:user_id)
      |> put_flash(:info, "Logged out.")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end
  