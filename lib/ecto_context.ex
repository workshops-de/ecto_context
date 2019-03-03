defmodule EctoContext do
  @moduledoc """
  Documentation for EctoContext.
  """

  defmacro __using__(opts) do
    opts = opts |> Keyword.put(:context_module, __CALLER__)

    quote do
      import Ecto.Query, warn: false
      require EctoContext
      import EctoContext

      context_actions(unquote(opts))
    end
  end

  defmacro context_actions(opts) do
    EctoContext.TemplateBuilder.run(opts)
    |> Code.string_to_quoted()
  end
end
