defmodule Planetarium do

  def add(id, [name: name, mass: mass]) do
    [%{id: id, name: name, mass: mass}]
  end

end
