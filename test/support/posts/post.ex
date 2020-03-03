defmodule EctoContext.Test.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias EctoContext.Test.Users.User

  schema "posts" do
    field :slug, :string
    field :title, :string
    timestamps()

    belongs_to :user, User
  end

  def changeset(user, attrs, type) when type in [:create, :update] do
    user
    |> cast(attrs, [:slug, :title])
    |> validate_required([:slug, :title])
  end
end
