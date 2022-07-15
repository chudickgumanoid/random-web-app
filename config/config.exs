# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :project_two,
  ecto_repos: [ProjectTwo.Repo]

# Configures the endpoint
config :project_two, ProjectTwoWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ProjectTwoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ProjectTwo.PubSub,
  live_view: [signing_salt: "sJLQ2lA6"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :project_two, ProjectTwo.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

# config :project_two, ProjectTwo.Mailer,
#   adapter: Bamboo.SMTPAdapter,
#   server: "smtp.mail.ru",
#   hostname: "your.domain",
#   port: 465,
#   # or {:system, "SMTP_USERNAME"}
#   username: "sashaq0708@mail.ru",
#   # or {:system, "SMTP_PASSWORD"}
#   password: "pa55word",
#   # can be `:always` or `:never`
#   tls: :if_available,
#   # or {:system, "ALLOWED_TLS_VERSIONS"} w/ comma separated values (e.g. "tlsv1.1,tlsv1.2")
#   allowed_tls_versions: [:tlsv1, :"tlsv1.1", :"tlsv1.2"],
#   tls_log_level: :error,
#   # optional, can be `:verify_peer` or `:verify_none`
#   tls_verify: :verify_peer,
#   # optional, path to the ca truststore
#   tls_cacertfile: "/somewhere/on/disk",
#   # optional, DER-encoded trusted certificates
#   tls_cacerts: "…",
#   # optional, tls certificate chain depth
#   tls_depth: 3,
#   # optional, tls verification function
#   tls_verify_fun: {&:ssl_verify_hostname.verify_fun/3, check_hostname: "example.com"},
#   # can be `true`
#   ssl: true,
#   retries: 1,
#   # can be `true`
#   no_mx_lookups: false,
#   # can be `:always`. If your smtp relay requires authentication set it to `:always`.
#   auth: :if_available
