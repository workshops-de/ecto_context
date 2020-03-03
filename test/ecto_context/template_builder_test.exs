defmodule EctoContext.TemplateBuilderTest do
  use ExUnit.Case

  alias EctoContext.TemplateBuilder

  describe "#run" do
    test "generates a template" do
      result = TemplateBuilder.run(module: EctoContext.Test.Posts.Post, default_param: :slug)
      assert result == File.read!("test/ecto_context/post_context_result.ex.eex")
    end
  end
end
