defmodule PlanetariumTest do
  use ExUnit.Case
  alias Planetarium, as: P

  test "it can create a planet" do
    earth = P.create_planet(:earth, name: "Earth", mass: 5.97)
    assert earth.id == :earth
    assert earth.name == "Earth"
    assert earth.mass == 5.97
  end

  test "it can create a system" do
    solar_system = P.create_system(:solar, name: "Solar")
    assert solar_system.id == :solar
    assert solar_system.name == "Solar"
    assert solar_system.planets == []
  end

  test "it can create a system with a planet" do
    earth = P.create_planet(:earth, name: "Earth", mass: 5.97)
    solar_system = P.create_system(:solar, name: "Solar", planets: [earth])
    assert solar_system.id == :solar
    assert solar_system.planets == [earth]
  end

  test "it can add planets to a system" do
    earth = P.create_planet(:earth, name: "Earth", mass: 5.97)
    mars = P.create_planet(:mars, name: "Mars", mass: 0.64)
    solar_system = P.create_system(:solar, name: "Solar", planets: [earth])
    with_mars = P.add_planet(solar_system, mars)
    assert with_mars.planets == [earth, mars]
  end

  test "it can calculate the total mass" do
    earth = P.create_planet(:earth, name: "Earth", mass: 5.97)
    mars = P.create_planet(:mars, name: "Mars", mass: 0.64)
    solar_system = P.create_system(:solar, name: "Solar", planets: [earth, mars])
    assert P.total_mass(solar_system) == 6.61
  end

  test "it can find a planet by id" do
    earth = P.create_planet(:earth, name: "Earth", mass: 5.97)
    mars = P.create_planet(:mars, name: "Mars", mass: 0.64)
    solar_system = P.create_system(:solar, name: "Solar", planets: [earth, mars])

    earth2 = P.find(solar_system, :earth)
    assert earth == earth2
  end
end
