defmodule EctoContextTest do
  use ExUnit.Case
  doctest EctoContext

  defmodule Posts do
    use EctoContext, module: EctoContext.Test.Posts.Post
  end

  test "generation of functions" do
    assert EctoContextTest.Posts.__info__(:functions) == [
      change: 1, change: 2,
      create: 0, create: 1, create: 2,
      delete: 1,
      get: 1, get: 2,
      get!: 1, get!: 2,
      list: 0, list: 1,
      list_for_user: 1, list_for_user: 2,
      schema: 0, schema: 1,
      update: 2, update: 3,
    ]
  end
end
