# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TimesheetDemo.Repo.insert!(%TimesheetDemo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
import Ecto.Query
alias TimesheetDemo.Repo
alias TimesheetDemo.Users.User
alias TimesheetDemo.Tasks.Task
alias TimesheetDemo.Requests.Request

password = Argon2.add_hash("password")[:password_hash]
# Repo.insert!(%User{name: "Alice", email: "alice.example.com", password_hash: password})
# Repo.insert!(%User{name: "Bob", email: "bob.example.com", password_hash: password, manager: 1})
# Repo.insert!(%User{name: "Faith", email: "faith.example.com", password_hash: password, manager: 1})
Repo.insert!(%Task{job_code: "JOB2", time: 1, desc: "Completed task 2", user_id: 2, request_id: 1})
# date = Ecto.Date.cast("2019-01-01")
# birthday = "01/01/2019"

# [dd, mm, yyyy] = String.split(birthday, "/")
# {:ok, date} = Date.from_iso8601("#{yyyy}-#{mm}-#{dd}")

# Repo.insert!(%Request{name: "request1", date: date, approval: false, user_id: 2, manager_id: 1})