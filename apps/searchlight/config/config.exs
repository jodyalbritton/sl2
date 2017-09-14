use Mix.Config

config :searchlight, ecto_repos: [Searchlight.Repo]

import_config "#{Mix.env}.exs"



# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Searchlight.Coherence.User,
  repo: Searchlight.Repo,
  module: Searchlight,
  web_module: SearchlightWeb,
  router: SearchlightWeb.Router,
  messages_backend: SearchlightWeb.Coherence.Messages,
  logged_out_url: "/",
  user_active_field: true,
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:confirmable, :rememberable, :registerable, :invitable, :authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token]

config :coherence, SearchlightWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: ""
# %% End Coherence Configuration %%
