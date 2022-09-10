defmodule Tailscale.Tailnet.ACL do

  import Tailscale, only: [get: 1, post: 2, parse: 1]

  def show(id), do: url(id) |> get() |> parse

  def create(id, data), do: url(id) |> post(data) |> parse #TODO: provide structure for data

  def validate(id, data), do: url(id, "validate") |> post(data) |> parse

  def preview(id, data), do: url(id, "preview") |> post(data) |> parse

  defp url, do: "tailnet"
  defp url(id), do: "#{url()}/#{id}/acl"
  defp url(id, action), do: "#{url()}/#{id}/acl/#{action}"
end
