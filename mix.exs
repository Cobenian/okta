defmodule Okta.Mixfile do
  use Mix.Project

  def project do
    [app: :okta,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: description,
     source_url: "https://github.com/Cobenian/okta",
     package: package ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [ {:httpoison, "~> 0.7.2"},
      {:poison, "~> 1.4.0"} ]
  end

  defp description do
    """
    An Elixir Library for interfacing Okta
    """
  end


  defp package do
      [# These are the default files included in the package
       files: ["lib", "files", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*", "*LICENSE"],
       contributors: ["Adam Guyot"],
       licenses: ["Apache 2.0"],
       links: %{"GitHub" => "https://github.com/Cobenian/okta"}]
  end
end

