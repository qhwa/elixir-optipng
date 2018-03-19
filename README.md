# Optipng

[![Inline docs](http://inch-ci.org/github/qhwa/elixir-optipng.svg)](http://inch-ci.org/github/qhwa/elixir-optipng)

This module is a simple wrapper of `optipng` command line application for optimising PNG images.  
To use this module, make sure you have `optipng` executable in you $PATH.

## Installation

add `optipng` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:optipng, "~> 0.1.0"}
  ]
end
```


## Usage

### `optimise/1`

```elixir
file_path = "my-pretty-image.png"

file_path
|> File.read!
|> Optipng.optimise
#=> {:ok, optimised_content}
```

### `optimise/2`

```elixir
file_path = "my-pretty-image.png"

file_path
|> File.read!
|> Optipng.optimise(self())

# continue doing anything you want

receive do
  {:ok, optimised_content} ->
    # deal with it
end
```

[documentation](https://hexdocs.pm/optipng/0.1.0/)
