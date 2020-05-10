defmodule Lfs do
  def search(filename, patterns) do
    File.stream!("#{data_dir()}/#{filename}", [:compressed])
    |> Flow.from_enumerable(max_demand: 100)
    |> Flow.partition(max_demand: 5, stages: 10)
    |> Flow.map(fn record ->
      if contains?(record, patterns) do
        save(record)
      end
    end)
    |> Enum.to_list()
  end

  def contains?(record, patterns) do
    record
    |> normalize()
    |> String.contains?(normalize(patterns))
  end

  @spec normalize(binary | maybe_improper_list) :: binary | [any]
  def normalize(items) when is_list(items) do
    items
    |> Enum.map(&normalize/1)
  end

  def normalize(item) do
    item
    |> String.trim()
    |> String.downcase()
  end

  defp data_dir do
    "#{File.cwd!()}/data"
  end

  defp save(record) do
    {:ok, file} = File.open("#{data_dir()}/matches.json", [:append])
    IO.binwrite(file, record)
    File.close(file)
  end
end
