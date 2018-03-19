defmodule Optipng.MixProject do
  use Mix.Project

  @description """
  A simple wrapper of `optipng` command line.
  """

  def project do
    [
      app: :optipng,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: @description,
      deps: deps(),
      package: package(),

      #docs
      name: "Optipng",
      source_url: "https://github.com/qhwa/elixir-optipng",
      homepage_url: "https://github.com/qhwa/elixir-optipng",
      docs: [
        main: "Optipng"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:temp, "~> 0.4"},
      {:credo, ">= 0.0.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:inch_ex, "~> 0.5", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      maintainers: ["qhwa"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/qhwa/elixir-optipng"}
    ]
  end
end
