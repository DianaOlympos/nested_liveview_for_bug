defmodule NestedLiveviewForBugWeb.PageLive do
  use NestedLiveviewForBugWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="text-center">
      minimal repro
    </h1>
    <br />
    <h2 class="text-center">
      Rendered statically, the title is:
    </h2>
    <%= live_render(@socket, NestedLiveviewForBugWeb.LiveTestTitle, id: "not-inside-for") %>

    <br />

    <.form for={:submit} phx-submit="submit" class="self-stretch flex flex-row">
      <%= Phoenix.HTML.Form.submit("submit",
        class: "self-center w-30 rounded py-2 px-3 mr-3 my-3 bg-amber-300"
      ) %>
    </.form>
    <%= if @child_title_2 do %>
      <h2 class="text-center">
        Added dynamically, the title is:
      </h2>
      <%= live_render(@socket, NestedLiveviewForBugWeb.LiveTestTitle, id: @child_title_2) %>
    <% end %>
    """
  end

  @impl true
  def mount(_params, _assigns, socket) do
    socket =
      socket
      |> assign(:child_title, "passed through assigns")
      |> assign(:child_title_2, false)

    {:ok, socket}
  end

  @impl true
  def handle_event("submit", _params, socket) do
    socket =
      socket
      |> assign(:child_title_2, ["passed through assigns list"])

    {:noreply, socket}
  end
end
