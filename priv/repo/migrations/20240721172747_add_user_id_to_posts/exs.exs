defmodule :"Elixir.Forum.Repo.Migrations.AddUserIdToPosts.exs" do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :user_id, references(:users, on_delete :nothing)
    end

  end
end
