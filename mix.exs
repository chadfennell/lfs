defmodule Lfs.MixProject do
  use Mix.Project

  def project do
    [
      app: :lfs,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Lfs, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:flow, "~> 1.0"}
    ]
  end
end

"Mexican American|Mexico|El Salvador|Hispanic|Chicano|All Souls"
