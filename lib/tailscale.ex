defmodule Tailscale do
  @moduledoc """
  Documentation for `Tailscale`.
  """

  use HTTPoison.Base

  @endpoint "https://api.tailscale.com/api/v2/"

  def process_url(url), do: @endpoint <> url

  def process_request_headers(headers) do
    [
      {"Content-type", "application/json"},
      {"Accept", "application/json"},
      {"User-Agent", "elixir-tailscale/#{Application.get_env(:tailscale, :version)}"},
      {"Authorization", "Basic #{get_encoded_token()}"}
    ] ++ headers
  end

  def process_request_body(req), do: Jason.encode!(req)

  def process_response_body(""), do: ""
  def process_response_body(body), do: Jason.decode!(body, keys: :atoms)

  def set_token(token), do: Application.put_env(:tailscale, :token, token)

  defp get_token, do: Application.get_env(:tailscale, :token)
  defp get_encoded_token, do: Base.encode64(get_token() <> ":")

  def parse({status, response}) when status == :ok and response.status_code < 400,
    do: {status, response.body, response.headers}

  def parse({status, response}) when status == :ok and response.status_code >= 400,
    do: {:error, response.body.message}

  def parse({status, response}) when status == :error, do: {status, response.reason}

  @doc """
  Shortname for `delete/1`
  """
  def del(path), do: delete(path)
  def del(path, data), do: delete(path, data)
end
