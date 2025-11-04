defmodule Core.Configuration.Domains.RawSchema do
  @moduledoc """
    Need Documentation
  """

  alias Core.Configuration.Domains.Process

  defstruct [:process]

  @type proccess_map :: %{
          optional(atom()) => Process.t()
        }
  @type config_schema :: %__MODULE__{
          process: proccess_map()
        }
  # process
  #   perfect:
  #     command: ""
  #   next:
  #     command: ""
end
