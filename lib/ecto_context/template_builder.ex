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

    EEx.eval_string(get_template(assigns.context.actions), [assigns: assigns], trim: false)
  end

  # Private functions
  defp get_template(actions) do
    actions
    |> Enum.map(&get_template_file/1)
    |> Enum.map(&File.read!/1)
    |> Enum.join("\n")
  end

  def get_template_file(action) do
    get_template_folder()
    |> Path.join("#{action}.ex.eex")
  end

  def get_template_folder do
    "priv/templates/ecto.context"
  end
end
