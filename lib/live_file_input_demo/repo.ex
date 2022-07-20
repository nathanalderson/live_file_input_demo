defmodule LiveFileInputDemo.Repo do
  use Ecto.Repo,
    otp_app: :live_file_input_demo,
    adapter: Ecto.Adapters.Postgres
end
