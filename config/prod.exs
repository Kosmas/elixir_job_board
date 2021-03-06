use Mix.Config

config :phoenix, JobBoard.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  code_reload: false,
  cookies: true,
  session_key: "_job_board_key",
  session_secret: "_J_3T4WIH$)SS6M$R1^U*N^7V@(XPMV!0Z$2X1CIG1@%H&)@75FP+DT&&MD7JEN8IWD"

config :phoenix, :logger,
  level: :error

