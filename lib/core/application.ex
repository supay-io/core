defmodule Core.Application do
  @moduledoc """
    Need Documentation
  """
  alias Core.Configuration.Infraestructure.LoadConfig
  use Application

  @impl true
  def start(_start_type, _start_args) do
    IO.puts("Started Application")

    case LoadConfig.load_config() do
      {:ok, message} ->
        IO.puts(inspect(message))

      {:error, message} ->
        IO.puts(message)
    end

    children_process = []
    opts_to_launch = [strategy: :one_for_one, name: Core.Supervidor]
    Supervisor.start_link(children_process, opts_to_launch)
  end
end
