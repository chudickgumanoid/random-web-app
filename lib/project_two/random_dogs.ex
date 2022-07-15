defmodule ProjectTwoWeb.RandomDogs do
  def get_url() do
    result = "https://random.dog/woof.json" |> HTTPoison.get |> parse_resp
    case result do
      {:ok, url} -> url
      :error -> "сегодня без картинок"
    end
  end

  defp parse_resp({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_url
  end

  defp parse_resp(_), do: :error
  defp pull_url(%{"url" => url}), do: {:ok, url}
  defp pull_url(_), do: :error
end
