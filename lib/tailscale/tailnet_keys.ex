defmodule Tailscale.Tailnet.Keys do

  import Tailscale, only: [get: 1, del: 1, post: 2, parse: 1]

  def list(id), do: url(id) |> get() |> parse

  def show(id, key_id), do: url(id, key_id) |> get() |> parse

  def create(id, data), do: url(id) |> post(%{ #TODO: provide structure for data
    "capabilities" => %{
      "devices" => %{
        "create" => data
      }
    }
  }) |> parse

  def delete(id, key_id), do: url(id, key_id) |> del() |> parse

  defp url, do: "tailnet"
  defp url(id), do: "#{url()}/#{id}/keys"
  defp url(id, key_id), do: "#{url()}/#{id}/keys/#{key_id}"
end
