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
end
