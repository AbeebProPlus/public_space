defmodule ForumWeb.MyPostJSON do
  alias Forum.MyPosts.MyPost

  @doc """
  Renders a list of my_posts.
  """
  def index(%{my_posts: my_posts}) do
    %{data: for(my_post <- my_posts, do: data(my_post))}
  end

  @doc """
  Renders a single my_post.
  """
  def show(%{my_post: my_post}) do
    %{data: data(my_post)}
  end

  defp data(%MyPost{} = my_post) do
    %{
      id: my_post.id,
      body: my_post.body,
      title: my_post.title
    }
  end
end
