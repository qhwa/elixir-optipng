defmodule Optipng do
  @moduledoc """
  Optipng use the command line `optipng` to optimise images.
  To use this module, make sure you have `optipng` executable
  in you $PATH.
  """

  @doc """
  Start a new process and optimise raw file content. When finished,
  the process will send result to the `from` process.
  """
  @spec optimise(binary, pid) :: pid
  def optimise(raw, from)
      when is_binary(raw) and is_pid(from) do
    spawn(fn ->
      send(from, optimise(raw))
    end)
  end

  @doc """
  Receive raw file content and invoke `optipng` to compress it,
  returning the compressed file content
  """
  @spec optimise(binary) :: {:ok, binary}
  def optimise(raw) when is_binary(raw) do
    with {:ok, path} = save_as_file(raw),
         :ok = invoke_optipng(path),
         {:ok, content} = File.read(path) do
      {:ok, content}
    end
  end

  defp save_as_file(content) do
    with {:ok, path} = Temp.path(), :ok = File.write(path, content, [:binary]) do
      {:ok, path}
    end
  end

  defp invoke_optipng(path) do
    {_, 0} = System.cmd("optipng", [path])
    :ok
  end
end
