defmodule ForumWeb.PageController do
  use ForumWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    IO.puts("Users function hit")

    users = [
      %{id: 1, name: "Habeeb", email: "habphysci@gmal.com"},
      %{id: 2, name: "Hasbi", email: "hasbi@gmail.com"}
    ]

    json(conn, %{users: users})
    # render(conn, :users, users: users, layout: false)
  end
end
