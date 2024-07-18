defmodule Forum.MyPosts do
  @moduledoc """
  The MyPosts context.
  """

  import Ecto.Query, warn: false
  alias Forum.Repo

  alias Forum.MyPosts.MyPost

  @doc """
  Returns the list of my_posts.

  ## Examples

      iex> list_my_posts()
      [%MyPost{}, ...]

  """
  def list_my_posts do
    Repo.all(MyPost)
  end

  @doc """
  Gets a single my_post.

  Raises `Ecto.NoResultsError` if the My post does not exist.

  ## Examples

      iex> get_my_post!(123)
      %MyPost{}

      iex> get_my_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_my_post!(id), do: Repo.get!(MyPost, id)

  @doc """
  Creates a my_post.

  ## Examples

      iex> create_my_post(%{field: value})
      {:ok, %MyPost{}}

      iex> create_my_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_my_post(attrs \\ %{}) do
    %MyPost{}
    |> MyPost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a my_post.

  ## Examples

      iex> update_my_post(my_post, %{field: new_value})
      {:ok, %MyPost{}}

      iex> update_my_post(my_post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_my_post(%MyPost{} = my_post, attrs) do
    my_post
    |> MyPost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a my_post.

  ## Examples

      iex> delete_my_post(my_post)
      {:ok, %MyPost{}}

      iex> delete_my_post(my_post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_my_post(%MyPost{} = my_post) do
    Repo.delete(my_post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking my_post changes.

  ## Examples

      iex> change_my_post(my_post)
      %Ecto.Changeset{data: %MyPost{}}

  """
  def change_my_post(%MyPost{} = my_post, attrs \\ %{}) do
    MyPost.changeset(my_post, attrs)
  end
end
