defmodule Day3Test do
  use ExUnit.Case
  import Day3

  doctest Day3

  test "day 3 part 1" do
    assert part_1(input()) == 552
  end

  # test "day 3 part 2" do
  #   assert part_2(input()) == 330_785
  # end

  def input do
    325489
  end
end
