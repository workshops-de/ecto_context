defmodule EctoContext.Test.Users.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    timestamps()

    has_many :posts, EctoContext.Test.Posts.Post
  end
end
