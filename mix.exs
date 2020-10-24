#  powered by metaL: https://github.com/ponyatov/metaL/wiki/metaL-manifest
defmodule Excamp.MixProject do
  use Mix.Project

  def project do
    [
      # \ <section:project>
      app: :excamp,
      version: "0.0.1",
      elixir: "~> 1.10",
      name: "excamp",
      description: "excamp",
      source_url: "https://github.com/ponyatov/metaL/tree/master/excamp",
      start_permanent: Mix.env() == :prod,
      docs: [extras: ["README.md"]],
      package: package(),
      deps: deps()
      # / <section:project>
    ]
  end

  def application do
    [
      mod: {Excamp.Application, []},
      applications: [
        # \ <section:apps>
        :cowboy
        # / <section:apps>
      ],
      extra_applications: [
        # \ <section:extra>
        :logger
        # / <section:extra>
      ]
    ]
  end

  defp deps do
    [
      # \ <section:deps>
      {:cowboy, "~> 1.0.0"},
      # / <section:deps>
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "excamp",
      files: ~w(lib src .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ponyatov/metaL/tree/master/excamp"},
      maintainers: ["Dmitry Ponyatov <dponyatov@gmail.com>"]
    ]
  end
end
