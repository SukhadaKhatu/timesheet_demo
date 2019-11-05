defmodule TimesheetDemo.Repo do
  use Ecto.Repo,
    otp_app: :timesheet_demo,
    adapter: Ecto.Adapters.Postgres
end
