defmodule Core.Configuration.Domains.Process do
  @moduledoc """
    Need Documentation
  """
  defstruct [:command, :name]

  @type t :: %__MODULE__{
          command: String.t(),
          name: String.t()
        }
end
