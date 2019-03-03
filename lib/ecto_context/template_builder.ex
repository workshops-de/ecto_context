defmodule EctoContext.TemplateBuilder do
  def run(opts) do
    assigns = %{
      context: EctoContext.Context.new(opts),
      schema: EctoContext.Schema.new(opts)
    }

    EEx.eval_file(get_template(opts), assigns: assigns)
  end

  defp get_template(opts) do
    opts[:template] ||
      Application.get_env(:ecto_context, :template) ||
      "#{__DIR__}/../../priv/templates/ecto.context/context.ex.eex"
  end
end
