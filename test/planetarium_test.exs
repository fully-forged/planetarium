defmodule PlanetariumTest do
  use ExUnit.Case
  alias Planetarium, as: P

  test "it can add a planet" do
    [earth] = P.add(:earth, name: "Earth", mass: 5.97)
    assert earth.id == :earth
    assert earth.name == "Earth"
    assert earth.mass == 5.97
  end
end
