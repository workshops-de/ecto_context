defmodule EctoContext.Test.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias EctoContext.Test.Posts.Post

  schema "users" do
    field :name, :string
    timestamps()

    has_many :posts, Post
  end

  def changeset(user, attrs, type) when type in [:create, :update] do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
