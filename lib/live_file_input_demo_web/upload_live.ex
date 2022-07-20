defmodule LiveFileInputDemoWeb.UploadLive do
  use Phoenix.LiveView
  require Logger

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <form id="upload-form" phx-submit="save" phx-change="validate">
      <textarea id="the-textarea" />
      <%= live_file_input @uploads.avatar %>
      <button type="submit">Upload</button>
    </form>

    <section phx-drop-target={@uploads.avatar.ref}>
      <%= for entry <- @uploads.avatar.entries do %>
        <p><%= entry.client_name %></p>
      <% end %>
    </section>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, socket |> allow_upload(:avatar, accept: ~w(.jpg .jpeg), max_entries: 2)}
  end

  @impl Phoenix.LiveView
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("save", _params, socket) do
    consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
      Logger.info("Consumed #{path}")
      {:ok, nil}
    end)

    {:noreply, socket}
  end
end
