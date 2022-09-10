defmodule TailscaleTest do
  use ExUnit.Case
  doctest Tailscale

  test "greets the world" do
    assert Tailscale.hello() == :world
  end
end
