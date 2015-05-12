defmodule Planetarium do
  defmodule Planet do
    defstruct id: nil, name: nil, mass: 0.0
  end

  defmodule System do
    defstruct id: nil, name: nil, planets: []
  end

  defimpl Enumerable, for: System do
    def count(system) do
      length(system.planets)
    end

    def member?(system, planet) do
      Enumerable.member?(system.planets, planet)
    end

    def reduce(system, acc, fun) do
      Enumerable.reduce(system.planets, acc, fun)
    end
  end

  def create_planet(id, name: name, mass: mass) do
    %Planet{id: id, name: name, mass: mass}
  end

  def create_system(id, opts) do
    %System{id: id, name: Dict.get(opts, :name), planets: Dict.get(opts, :planets, [])}
  end

  def add_planet(system = %System{planets: planets}, planet) do
    %System{system|planets: [planet | planets] |> Enum.reverse}
  end

  def total_mass(system) do
    Enum.reduce(system, 0, fn(p, total) ->
      total + p.mass
    end) |> Float.round(2)
  end

  def find(system, planet_id) do
    Enum.find(system, fn(p) ->
      p.id == planet_id
    end)
  end

  def update_planet(system, planet_id, opts) do
    new_planets = Enum.map(system, fn(planet) ->
      do_update_planet(planet, planet_id, opts)
    end)
    %System{system|planets: new_planets}
  end

  defp do_update_planet(planet = %Planet{id: planet_id}, planet_id, opts) do
    Enum.reduce(opts, planet, fn({k,v}, updated_planet) ->
      Map.put(updated_planet, k, v)
    end)
  end

  defp do_update_planet(planet, _planet_id, _opts) do
    planet
  end
end
