defmodule Core.Configuration.Domains.ConfigSchema do
  @moduledoc """
    Need Documentation
  """

  alias Core.Configuration.Domains.Process
  defstruct [:process]

  @type process_map :: %{
          atom() => Process.t()
        }
  @type t :: %__MODULE__{
          process: process_map()
        }
end
