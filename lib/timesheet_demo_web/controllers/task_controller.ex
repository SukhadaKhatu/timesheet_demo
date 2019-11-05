defmodule TimesheetDemoWeb.TaskController do
  use TimesheetDemoWeb, :controller

  alias TimesheetDemo.Tasks
  alias TimesheetDemo.Tasks.Task

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, %{"request" => request}) do
    changeset = Tasks.change_task(%Task{})
    render(conn, "new.html", changeset: changeset, request: request)
  end

  def create(conn, %{"task" => task_params}) do
    request = task_params["request_id"]
    
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show_tasks(conn, %{"id" => id}) do
    tasks = Tasks.get_task!(id)
    render(conn, "show_tasks.html", task: tasks, id: id)
  end

  def show(conn, %{"id" => id}) do
    tasks = Tasks.get_all(id)
    IO.inspect(tasks)
    count = Tasks.get_count(id)
    render(conn, "show.html", tasks: tasks, count: count, request: id)
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    changeset = Tasks.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
