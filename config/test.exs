use Mix.Config

# Configure your database
config :timesheet_demo, TimesheetDemo.Repo,
  username: "timesheet_demo",
  password: "ohLaX3pei2Ob",
  database: "timesheet_demo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :timesheet_demo, TimesheetDemoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
