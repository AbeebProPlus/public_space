defmodule ForumWeb.MyPostController do
  use ForumWeb, :controller

  alias Forum.MyPosts
  alias Forum.MyPosts.MyPost

  action_fallback ForumWeb.FallbackController

  def index(conn, _params) do
    my_posts = MyPosts.list_my_posts()
    render(conn, :index, my_posts: my_posts)
  end

  def create(conn, %{"my_post" => my_post_params}) do
    with {:ok, %MyPost{} = my_post} <- MyPosts.create_my_post(my_post_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/my_posts/#{my_post}")
      |> render(:show, my_post: my_post)
    end
  end

  def show(conn, %{"id" => id}) do
    my_post = MyPosts.get_my_post!(id)
    render(conn, :show, my_post: my_post)
  end

  def update(conn, %{"id" => id, "my_post" => my_post_params}) do
    my_post = MyPosts.get_my_post!(id)

    with {:ok, %MyPost{} = my_post} <- MyPosts.update_my_post(my_post, my_post_params) do
      render(conn, :show, my_post: my_post)
    end
  end

  def delete(conn, %{"id" => id}) do
    my_post = MyPosts.get_my_post!(id)

    with {:ok, %MyPost{}} <- MyPosts.delete_my_post(my_post) do
      send_resp(conn, :no_content, "")
    end
  end
end
