defmodule Tailscale.Tailnet do

  defp url, do: "tailnet"
  defp url(id), do: "#{url()}/#{id}"
  defp url(id, action), do: "#{url(id)}/#{action}"
end
