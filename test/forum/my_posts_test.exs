defmodule Forum.MyPostsTest do
  use Forum.DataCase

  alias Forum.MyPosts

  describe "my_posts" do
    alias Forum.MyPosts.MyPost

    import Forum.MyPostsFixtures

    @invalid_attrs %{title: nil, body: nil}

    test "list_my_posts/0 returns all my_posts" do
      my_post = my_post_fixture()
      assert MyPosts.list_my_posts() == [my_post]
    end

    test "get_my_post!/1 returns the my_post with given id" do
      my_post = my_post_fixture()
      assert MyPosts.get_my_post!(my_post.id) == my_post
    end

    test "create_my_post/1 with valid data creates a my_post" do
      valid_attrs = %{title: "some title", body: "some body"}

      assert {:ok, %MyPost{} = my_post} = MyPosts.create_my_post(valid_attrs)
      assert my_post.title == "some title"
      assert my_post.body == "some body"
    end

    test "create_my_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MyPosts.create_my_post(@invalid_attrs)
    end

    test "update_my_post/2 with valid data updates the my_post" do
      my_post = my_post_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body"}

      assert {:ok, %MyPost{} = my_post} = MyPosts.update_my_post(my_post, update_attrs)
      assert my_post.title == "some updated title"
      assert my_post.body == "some updated body"
    end

    test "update_my_post/2 with invalid data returns error changeset" do
      my_post = my_post_fixture()
      assert {:error, %Ecto.Changeset{}} = MyPosts.update_my_post(my_post, @invalid_attrs)
      assert my_post == MyPosts.get_my_post!(my_post.id)
    end

    test "delete_my_post/1 deletes the my_post" do
      my_post = my_post_fixture()
      assert {:ok, %MyPost{}} = MyPosts.delete_my_post(my_post)
      assert_raise Ecto.NoResultsError, fn -> MyPosts.get_my_post!(my_post.id) end
    end

    test "change_my_post/1 returns a my_post changeset" do
      my_post = my_post_fixture()
      assert %Ecto.Changeset{} = MyPosts.change_my_post(my_post)
    end
  end
end
