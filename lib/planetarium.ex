defmodule Planetarium do
  defmodule Planet do
    defstruct id: nil, name: nil, mass: 0.0
  end

  defmodule System do
    defstruct id: nil, name: nil, planets: []
  end

  def create_planet(id, name: name, mass: mass) do
    %Planet{id: id, name: name, mass: mass}
  end

  def create_system(id, opts) do
    %System{id: id, name: Dict.get(opts, :name), planets: Dict.get(opts, :planets, [])}
  end
end
