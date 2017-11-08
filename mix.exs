defmodule Mailgun.Mixfile do
  use Mix.Project

  def project do
    [app: :mailgun,
     version: "0.1.0",
     build_path: "_build",
     lockfile: "mix.lock",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
   
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:poison, "~> 3.1",override: :true}, {:httpoison, "~> 0.11.0"}, {:plug, "~> 1.4"}]
  end
end
