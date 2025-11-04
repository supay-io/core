defmodule Core.Configuration.Infraestructure.LoadConfig do
  @moduledoc """
    Need Documentation
  """

  alias Core.Configuration.Domains.ConfigSchema
  @spec load_config(String.t()) :: {:ok, ConfigSchema.t()} | {:error, String.t()}
  @spec load_config() ::
          {:error, <<_::64, _::_*8>>} | {:ok, Core.Configuration.Domains.ConfigSchema.t()}
  def load_config(path \\ "supay.yml") do
    try do
      case YamlElixir.read_all_from_file(path, atoms: true) do
        {:ok, [data | _]} ->
          process =
            data
            |> keys_to_atoms()
            |> then(&struct(ConfigSchema, &1))

          {:ok, process}

        {:ok, []} ->
          {:error, "Empty YAML file"}

        {:error, reason} ->
          {:error, "Failed to load config: #{inspect(reason)}"}
      end
    rescue
      _e in YamlElixir.FileNotFoundError ->
        {:error, "Config file not found: #{path}"}

      e in KeyError ->
        {:error, "Missing required config key: #{e.key}"}

      e in ArgumentError ->
        {:error, "Invalid config format: #{Exception.message(e)}"}

      e ->
        {:error, "Unexpected error loading config: #{Exception.message(e)}"}
    end
  end

  defp keys_to_atoms(string_key_map)
       when is_map(string_key_map) do
    for {key, val} <- string_key_map, into: %{}, do: {String.to_atom(key), keys_to_atoms(val)}
  end

  defp keys_to_atoms(value), do: value
end
