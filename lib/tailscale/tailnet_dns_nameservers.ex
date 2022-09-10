defmodule Tailscale.Tailnet.DNS.Nameservers do

  import Tailscale, only: [get: 1, post: 2, parse: 1]

  def show(id), do: url(id) |> get() |> parse

  def update(id, nameserver_list), do: url(id) |> post(%{ "dns" => nameserver_list }) |> parse

  defp url, do: "tailnet"
  defp url(id), do: "#{url()}/#{id}/dns/nameservers"
end
