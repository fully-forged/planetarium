defmodule Planetarium do
  defmodule Planet do
    defstruct id: nil, name: nil, mass: 0.0
  end

  def add(id, [name: name, mass: mass]) do
    [%Planet{id: id, name: name, mass: mass}]
  end
end
