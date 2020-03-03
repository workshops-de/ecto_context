defmodule EctoContext.Test.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, otp_app: :ecto_context

  #def init(_type, config) do
  #  {:ok, Keyword.put(config, :url, System.get_env("DATABASE_URL"))}
  #end
end
