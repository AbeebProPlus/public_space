defmodule Forum.Repo.Migrations.CreateMyPosts do
  use Ecto.Migration

  def change do
    create table(:my_posts) do
      add :body, :string
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
