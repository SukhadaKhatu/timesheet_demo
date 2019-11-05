defmodule TimesheetDemo.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :job_code, :string
    field :time, :integer
    field :desc, :string
    # field :user_id, :id
    belongs_to :user, TimesheetDemo.Users.User
    belongs_to :request, TimesheetDemo.Requests.Request

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    IO.inspect(attrs)
    task
    |> cast(attrs, [:job_code, :time, :desc, :request_id, :user_id])
    |> validate_required([:job_code, :time, :desc, :request_id, :user_id])
  end
end
