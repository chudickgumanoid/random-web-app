defmodule ProjectTwoWeb.Waifu do
  def get_waifu() do
    result = "https://api.waifu.pics/sfw/waifu" |> HTTPoison.get |> parse_resp
    case result do
      {:ok, waifu} -> waifu
      :error -> "сегодня без картинок"
    end
  end

  defp parse_resp({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_waifu
  end

  defp parse_resp(_), do: :error
  defp pull_waifu(%{"url" => waifu}), do: {:ok, waifu}
  defp pull_waifu(_), do: :error
end
