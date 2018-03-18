defmodule OptipngTest do
  use ExUnit.Case
  doctest Optipng

  test "optimise png content" do
    ret = "test/fixtures/1.png"
          |> File.read!
          |> Optipng.optimise
          
    assert {:ok, _} = ret
  end
end
