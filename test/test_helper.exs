{:ok, _} = EctoContext.Test.Repo.start_link()

ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(EctoContext.Test.Repo, :manual)
