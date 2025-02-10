defmodule EctoContext do
  @moduledoc """
  Documentation for EctoContext.
  """

  defmacro __using__(opts) do
    opts = opts |> Keyword.put(:context_module, Macro.escape(__CALLER__))

    quote do
      require Ecto.Query
      require EctoContext
      import EctoContext

      context_actions(unquote(opts))
    end
  end

  defmacro context_actions(opts) do
    opts
    |> EctoContext.TemplateBuilder.run()
    |> Code.string_to_quoted()
  end
end
