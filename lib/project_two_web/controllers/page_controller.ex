defmodule ProjectTwoWeb.PageController do
  use ProjectTwoWeb, :controller

  alias ProjectTwoWeb.{Repo, ProjectTwoWeb, ChuckNorris, RandomDogs, Waifu}

  def index(conn, _params) do
    joke = ChuckNorris.get_joke()
    url = RandomDogs.get_url()
    waifu = Waifu.get_waifu()

    render(conn, "index.html", joke: joke, url: url, waifu: waifu)
  end
end
