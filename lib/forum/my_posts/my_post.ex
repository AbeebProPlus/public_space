defmodule Forum.MyPosts.MyPost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "my_posts" do
    field :title, :string
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(my_post, attrs) do
    my_post
    |> cast(attrs, [:body, :title])
    |> validate_required([:body, :title])
  end
end
