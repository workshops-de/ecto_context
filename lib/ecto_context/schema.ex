defmodule EctoContext.Schema do
  @moduledoc """
  Struct and builder for all the necessary options used
  in the template
  """
  defstruct module: nil,
            repo: nil,
            singular: nil,
            plural: nil,
            human_singular: nil,
            human_plural: nil,
            default_param: :nil,
            actions: [],
            assocs: []

  @doc """
  Fills the struct from external options.
  E.g.: `use EctoContext, module: EctoContext.Test.Posts.Post, repo: ...`

  iex> new(module: EctoContext.Test.Posts.Post, default_param: :slug)
  %EctoContext.Schema{
    module: EctoContext.Test.Posts.Post,
    repo: EctoContext.Test.Repo,
    singular: "post",
    plural: "posts",
    human_singular: "Post",
    human_plural: "Posts",
    default_param: :slug,
    actions: [],
    assocs: [
      %Ecto.Association.BelongsTo{
        cardinality: :one,
        defaults: [],
        field: :user,
        on_cast: nil,
        on_replace: :raise,
        owner: EctoContext.Test.Posts.Post,
        owner_key: :user_id,
        queryable: EctoContext.Test.Users.User,
        related: EctoContext.Test.Users.User,
        related_key: :id,
        relationship: :parent,
        unique: true,
        where: []
      }
    ]
  }
  """
  def new(opts) when is_list(opts) do
    schema_module = opts[:module] || raise "You must specify a module"
    module = Macro.expand(schema_module, opts[:context_module])
    repo = opts[:repo] || Application.get_env(:ecto_context, :repo) || raise "You must specify a repo"
    singular = module |> Module.split() |> List.last() |> Macro.underscore()
    plural = opts[:plural] || module.__schema__(:source)
    default_param = opts[:default_param] || :id

    %EctoContext.Schema{
      module: module,
      repo: repo,
      singular: singular,
      plural: plural,
      human_singular: humanize(singular),
      human_plural: humanize(plural),
      assocs: get_assocs(module),
      default_param: default_param
    }
  end

  # Private functions
  defp get_assocs(module) do
   module.__schema__(:associations)
   |> Enum.map(fn association_atom -> module.__schema__(:association, association_atom) end)
  end

  defp humanize(bin) when is_binary(bin) do
    bin |> String.replace("_", " ") |> String.capitalize
  end
end
