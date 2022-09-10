defmodule Tailscale.Tailnet.DNS.Preferences do

  import Tailscale, only: [get: 1, post: 2, parse: 1]

  def show(id), do: url(id) |> get() |> parse

  def enable_magic_dns(id), do: url(id) |> post(%{ "magicDNS" => true }) |> parse

  def disable_magic_dns(id), do: url(id) |> post(%{ "magicDNS" => false }) |> parse

  defp url, do: "tailnet"
  defp url(id), do: "#{url()}/#{id}/dns/preferences"
end
