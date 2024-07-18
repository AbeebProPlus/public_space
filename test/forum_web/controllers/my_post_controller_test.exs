defmodule ForumWeb.MyPostControllerTest do
  use ForumWeb.ConnCase

  import Forum.MyPostsFixtures

  alias Forum.MyPosts.MyPost

  @create_attrs %{
    title: "some title",
    body: "some body"
  }
  @update_attrs %{
    title: "some updated title",
    body: "some updated body"
  }
  @invalid_attrs %{title: nil, body: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all my_posts", %{conn: conn} do
      conn = get(conn, ~p"/api/my_posts")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create my_post" do
    test "renders my_post when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/my_posts", my_post: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/my_posts/#{id}")

      assert %{
               "id" => ^id,
               "body" => "some body",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/my_posts", my_post: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update my_post" do
    setup [:create_my_post]

    test "renders my_post when data is valid", %{conn: conn, my_post: %MyPost{id: id} = my_post} do
      conn = put(conn, ~p"/api/my_posts/#{my_post}", my_post: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/my_posts/#{id}")

      assert %{
               "id" => ^id,
               "body" => "some updated body",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, my_post: my_post} do
      conn = put(conn, ~p"/api/my_posts/#{my_post}", my_post: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete my_post" do
    setup [:create_my_post]

    test "deletes chosen my_post", %{conn: conn, my_post: my_post} do
      conn = delete(conn, ~p"/api/my_posts/#{my_post}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/my_posts/#{my_post}")
      end
    end
  end

  defp create_my_post(_) do
    my_post = my_post_fixture()
    %{my_post: my_post}
  end
end
