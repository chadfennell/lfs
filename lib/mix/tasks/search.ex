defmodule Mix.Tasks.Lfs.Search do
  use Mix.Task

  @shortdoc "Search a Large File"
  def run(args) do
    filename = args |> List.first()

    patterns =
      args
      |> List.last()
      |> String.split("|")

    Lfs.search(filename, patterns)
  end
end
