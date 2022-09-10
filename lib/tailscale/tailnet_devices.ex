defmodule Tailscale.Tailnet.Devices do

  import Tailscale, only: [get: 1, parse: 1]

  def list(id), do: url(id, "all") |> get() |> parse

  defp url, do: "tailnet"
  defp url(id), do: "#{url()}/#{id}/devices"
  defp url(id, fields), do: "#{url(id)}?fields=#{fields}"
end
