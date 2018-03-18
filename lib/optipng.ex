defmodule Optipng do
  @moduledoc """
  Documentation for Optipng.
  """

  @doc """
  Hello world.
  """
  def optimise(raw_file_content) when is_binary(raw_file_content) do
    with {:ok, path} = save_to_temp_file(raw_file_content),
         :ok = invoke_optipng(path),
         {:ok, content} = File.read(path) do
      {:ok, content}
    end
  end


  defp save_to_temp_file(content) do
    with {:ok, path} = Temp.path,
         :ok = File.write(path, content, [:binary]) do
      {:ok, path}
    end
  end


  defp invoke_optipng(path) do
    {_, 0} = System.cmd("optipng", [path])
    :ok
  end

end
