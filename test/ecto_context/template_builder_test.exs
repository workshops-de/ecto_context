defmodule EctoContext.TemplateBuilderTest do
  use ExUnit.Case

  alias EctoContext.TemplateBuilder

  describe "#run" do
    test "generates a template" do
      result = TemplateBuilder.run(module: EctoContext.Test.Posts.Post, template: "test/support/test_template.ex.eex")
      assert result == "def post_list do\n  1 + 1\nend\n"
    end
  end
end
