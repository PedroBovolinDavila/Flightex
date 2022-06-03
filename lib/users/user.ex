defmodule Flightex.Users.User do
  @keys [:name, :email, :cpf, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf) when is_bitstring(cpf) do
    id = UUID.uuid4()

    user = %__MODULE__{
      id: id,
      name: name,
      email: email,
      cpf: cpf
    }

    {:ok, user}
  end

  def build(_name, _email, _cpf), do: {:error, "Cpf must be a String"}
end
