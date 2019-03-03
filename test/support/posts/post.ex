defmodule EctoContext.Test.Posts.Post do
  use Ecto.Schema

  schema "posts" do
    field :slug, :string
    field :title, :string
    timestamps()

    belongs_to :user, EctoContext.Test.Users.User
  end
end
