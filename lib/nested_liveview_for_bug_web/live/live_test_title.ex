defmodule NestedLiveviewForBugWeb.LiveTestTitle do
  use NestedLiveviewForBugWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h3 class="text-center">
      <%= @child_title %>
    </h3>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    socket = assign_new(socket, :child_title, fn -> "not through assign_new" end)

    {:ok, socket}
  end
end
