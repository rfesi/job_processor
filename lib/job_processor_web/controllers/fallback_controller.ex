defmodule JobProcessorWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use JobProcessorWeb, :controller

  def call(conn, {:error, changesets}) when is_list(changesets) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(JobProcessorWeb.ChangesetView)
    |> render("errors.json", changesets: changesets)
  end
end
