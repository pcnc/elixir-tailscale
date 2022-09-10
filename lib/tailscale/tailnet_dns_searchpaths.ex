defmodule Tailscale.Tailnet.DNS.SearchPaths do

  import Tailscale, only: [get: 1, post: 2, parse: 1]

  def show(id), do: url(id) |> get() |> parse

  def update(id, searchpath_list), do: url(id) |> post(%{ "searchpaths" => searchpath_list }) |> parse

  defp url, do: "tailnet"
  defp url(id), do: "#{url()}/#{id}/dns/searchpaths"
end
