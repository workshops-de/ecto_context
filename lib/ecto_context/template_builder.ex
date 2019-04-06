defmodule EctoContext.TemplateBuilder do
  @moduledoc """
  The TemplateBuilder uses the context and schema struct
  and passes them to a template. The result is a string
  which can be used by the main macro.
  """

  def run(opts) do
    assigns = %{
      context: EctoContext.Context.new(opts),
      schema: EctoContext.Schema.new(opts)
    }

    EEx.eval_file(get_template(opts), [assigns: assigns], trim: false)
  end

  defp get_template(opts) do
    opts[:template] ||
      Application.get_env(:ecto_context, :template) ||
      "#{__DIR__}/../../priv/templates/ecto.context/context.ex.eex"
  end
end
