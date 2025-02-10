defmodule EctoContext do
  @moduledoc """
  Documentation for EctoContext.
  """

  defmacro __using__(opts) do
    # Ensure opts is a keyword list and normalize the module option
    opts = case opts[:module] do
      {:__aliases__, _, _} = module_ast ->
        # If it's an AST node, expand it in the caller's context
        expanded_module = Macro.expand(module_ast, __CALLER__)
        opts
        |> Keyword.put(:module, expanded_module)
        |> Keyword.put(:context_module, __CALLER__)
      module when is_atom(module) ->
        opts
        |> Keyword.put(:context_module, __CALLER__)
      _ ->
        raise ArgumentError, "module option must be provided as a module name or alias"
    end

    quote do
      require Ecto.Query
      require EctoContext
      import EctoContext

      context_actions(unquote(Macro.escape(opts)))
    end
  end

  defmacro context_actions(opts) do
    opts
    |> EctoContext.TemplateBuilder.run()
    |> Code.string_to_quoted()
  end
end
