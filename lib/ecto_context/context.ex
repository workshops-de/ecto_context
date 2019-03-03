defmodule EctoContext.Context do
  @moduledoc """
  Struct and builder for all the necessary options used
  in the template
  """
  defstruct actions: []

  @actions [:list, :get, :create, :update, :delete, :change]

  @doc """
  Fills the struct from external options.
  E.g.: `use EctoContext, module: EctoContext.Test.Posts.Post, repo: ...`

  iex> new(module: EctoContext.Test.Posts.Post, default_param: :slug)
  %EctoContext.Context{
  }
  """
  def new(opts) when is_list(opts) do

    %EctoContext.Context{
    }
  end

  # Private functions
  def validate_actions(type, actions) do
    unless actions -- @actions == [],
      do:
        raise(ArgumentError, """
        invalid :#{type} action(s) passed to resources.

        supported actions: #{inspect(@actions)}

        got: #{inspect(@actions)}
        """)

    @actions
  end
end
