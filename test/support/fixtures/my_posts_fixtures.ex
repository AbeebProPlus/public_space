defmodule Forum.MyPostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Forum.MyPosts` context.
  """

  @doc """
  Generate a my_post.
  """
  def my_post_fixture(attrs \\ %{}) do
    {:ok, my_post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Forum.MyPosts.create_my_post()

    my_post
  end
end
