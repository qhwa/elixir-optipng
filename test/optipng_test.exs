defmodule OptipngTest do
  use ExUnit.Case
  doctest Optipng

  test "optimise png content" do
    ret =
      "test/fixtures/1.png"
      |> File.read!()
      |> Optipng.optimise()

    assert {:ok, _} = ret
  end

  test "optimise with process" do
    ret =
      "test/fixtures/1.png"
      |> File.read!()
      |> Optipng.optimise(self())

    assert Process.alive?(ret)

    receive do
      {:ok, content} ->
        assert byte_size(content) == 36505
    end
  end
end
