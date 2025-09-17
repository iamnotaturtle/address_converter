defmodule AddressConverter.MixProject do
  use Mix.Project

  def project do
    [
      app: :address_converter,
      version: "0.1.0",
      elixir: "~> 1.18",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "A library for converting addresses between different formats."
  end

  defp package do
    [
      maintainers: [
        "iamnotaturtle"
      ],
      licenses: ["MIT"],
      links: %{github: "https://github.com/iamnotaturtle/address_converter"},
      files: ~w(lib CHANGELOG.md LICENSE.md mix.exs README.md)
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:blake2_elixir, "~> 0.9.0"},
      {:b58, "~> 1.0.2"},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false}
    ]
  end
end
