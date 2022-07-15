defmodule ProjectTwoWeb.ChuckNorris do
  def get_joke() do
    result = "http://api.icndb.com/jokes/random" |> HTTPoison.get |> parse_resp
    case result do
      {:ok, joke} -> joke
      :error -> "сегодня без шуток"
    end
  end

  defp parse_resp({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_joke
  end

  defp parse_resp(_), do: :error
  defp pull_joke(%{"value" => %{"joke" => joke}}), do: {:ok, joke}
  defp pull_joke(_), do: :error
end
