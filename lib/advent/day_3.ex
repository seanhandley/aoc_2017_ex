defmodule Advent.Day3 do
  @moduledoc """

  *Spiral Memory: You come across an experimental new kind of memory stored on an infinite two-dimensional grid.*

  ## Day 3: Spiral Memory

  You come across an experimental new kind of memory stored on an infinite two-dimensional grid.

  Each square on the grid is allocated in a spiral pattern starting at a location marked 1 and then counting up while spiraling outward. For example, the first few squares are allocated like this:

      17  16  15  14  13
      18   5   4   3  12
      19   6   1   2  11
      20   7   8   9  10
      21  22  23---> ...

  While this is very space-efficient (no squares are skipped), requested data must be carried back to square 1 (the location of the only access port for this memory system) by programs that can only move up, down, left, or right. They always take the shortest path: the Manhattan Distance between the location of the data and square 1.

  For example:

  * Data from square `1` is carried `0` steps, since it's at the access port.
  * Data from square `12` is carried `3` steps, such as: `down`, `left`, `left`.
  * Data from square `23` is carried only `2` steps: `up` twice.
  * Data from square `1024` must be carried `31` steps.

  How many steps are required to carry the data from the square identified in your puzzle input all the way to the access port?

  ## Part Two

  As a stress test on the system, the programs here clear the grid and then store the value `1` in square `1`. Then, in the same allocation order as shown above, they store the sum of the values in all adjacent squares, including diagonals.

  So, the first few squares' values are chosen as follows:

  * Square `1` starts with the value `1`.
  * Square `2` has only one adjacent filled square (with value `1`), so it also stores `1`.
  * Square `3` has both of the above squares as neighbors and stores the sum of their values, `2`.
  * Square `4` has all three of the aforementioned squares as neighbors and stores the sum of their values, `4`.
  * Square `5` only has the first and fourth squares as neighbors, so it gets the value `5`.

  Once a square is written, its value does not change. Therefore, the first few squares would receive the following values:

      147  142  133  122   59
      304    5    4    2   57
      330   10    1    1   54
      351   11   23   25   26
      362  747  806--->   ...

  What is the first value written that is larger than your puzzle input?
  """

  def part_1(string)

  def part_1(input) do
    input
  end

  def part_2(string)

  def part_2(input) do
    input
  end

  defp ordering do
    Enum.cycle([:right, :up, :left, :down])
  end

  defp spiral_sequence do
    build_spiral_sequence(max_size)
  end

  defp build_spiral_sequence(num) do
    0..num
    |> Stream.transform({0,1}, &do_build_spiral_sequence/2)
    |> MapSet.new
  end

  defp do_build_spiral_sequence(i, acc) do
    {diff, count} = acc
    prev = List.fetch(seq, i)
    if count == 2 do
      new_count = 0
      new_diff  = diff + 1
    else
      new_count = count + 1
      new_diff  = diff
    end

    if i < num do
      {[prev+diff],{new_count, new_diff}, acc}
    else
      {:halt, acc}
    end
  end

  # def change_direction?(num) 
  #   spiral_sequence.include?(num)
  # end

  def change_direction?(spiral_sequence, num) do
    Enum.member?(spiral_sequence, num)
  end

  # def spiral
  #   direction = nil
  #   (1..max_size).each_with_object({}) do |num, spiral|
  #     direction = ordering.next if change_direction?(num)
  #     spiral[num] ||= direction
  #   end
  # end

  # def spiral do
    
  # end

  def distance(x, y, orig) do
    abs(x - orig) + abs(y - orig)
  end

  # def calculate_distance(max_size)
  #   x = y = original_coords = size / 4 / 2
  #   (1..max_size).each do |num|
  #     return distance(x, y, original_coords) if max_size == num
  #     case spiral[num]
  #     when :up
  #       y -= 1
  #     when :down
  #       y += 1
  #     when :left
  #       x -= 1
  #     when :right
  #       x += 1
  #     end
  #   end
  # end

end
