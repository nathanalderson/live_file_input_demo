defmodule LiveFileInputDemoWeb.PageController do
  use LiveFileInputDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
