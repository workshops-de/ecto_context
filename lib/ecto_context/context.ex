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

  iex> new()
  %EctoContext.Context{
    actions: [:list, :get, :create, :update, :delete, :change]
  }

  iex> new(only: [:list, :get]).actions
  [:list, :get]

  iex> new(except: [:list, :get]).actions
  [:create, :update, :delete, :change]
  """
  def new(opts \\ []) when is_list(opts) do
    %EctoContext.Context{
      actions: extract_actions(opts)
    }
  end

  # Private functions
  defp extract_actions(opts) do
    only = Keyword.get(opts, :only)
    except = Keyword.get(opts, :except)

    cond do
      only ->
        supported_actions = validate_actions(:only, only)
        supported_actions -- supported_actions -- only

      except ->
        supported_actions = validate_actions(:except, except)
        supported_actions -- except

      true ->
        @actions
    end
  end

  defp validate_actions(type, actions) do
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
