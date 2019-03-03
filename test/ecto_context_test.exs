defmodule EctoContextTest do
  use ExUnit.Case
  doctest EctoContext

  defmodule Posts do
    use EctoContext, module: EctoContext.Test.Posts.Post
  end

  test "generation of functions" do
    assert EctoContextTest.Posts.__info__(:functions) == [list: 0]
  end
end
