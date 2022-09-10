defmodule Tailscale.Device do

  import Tailscale, only: [get: 1, del: 1, post: 2, parse: 1]

  def show(id), do: url(id) |> get |> parse

  def delete(id), do: url(id) |> del

  def authorize(id) do
    url(id, "authorized")
    |> post(%{
      "authorized" => true
    })
    |> parse
  end

  def set_acl_tags(id, tags) do
    url(id, "tags")
    |> post(%{
      "tags" => tags
    })
    |> parse
  end

  def enable_key_expiry(id) do
    url(id, "key")
    |> post(%{
      "keyExpiryDisabled" => false
    })
    |> parse
  end

  def disable_key_expiry(id) do
    url(id, "key")
    |> post(%{
      "keyExpiryDisabled" => true
    })
    |> parse
  end

  defp url, do: "device"
  defp url(id), do: "#{url()}/#{id}"
  defp url(id, action), do: "#{url(id)}/#{action}"
end
