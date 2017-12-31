defmodule Advent.Day2 do
  @moduledoc """

  *Corruption Checksum: As you walk through the door, a glowing humanoid shape yells in your direction.*

  ## Day 2: Corruption Checksum

  As you walk through the door, a glowing humanoid shape yells in your direction. *"You there! Your state appears to be idle. Come help us repair the corruption in this spreadsheet - if we take another millisecond, we'll have to display an hourglass cursor!"*

  The spreadsheet consists of rows of apparently-random numbers. To make sure the recovery process is on the right track, they need you to calculate the spreadsheet's checksum. For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all of these differences.

  For example, given the following spreadsheet:

      5 1 9 5
      7 5 3
      2 4 6 8

  * The first row's largest and smallest values are `9` and `1`, and their difference is `8`.
  * The second row's largest and smallest values are `7` and `3`, and their difference is `4`.
  * The third row's difference is `6`.

  In this example, the spreadsheet's checksum would be `8 + 4 + 6 = 18`.

  What is the checksum for the spreadsheet in your puzzle input?

  ## Part Two

  *"Great work; looks like we're on the right track after all. Here's a star for your effort."* However, the program seems a little worried. Can programs be worried?

  *"Based on what we're seeing, it looks like all the User wanted is some information about the evenly divisible values in the spreadsheet. Unfortunately, none of us are equipped for that kind of calculation - most of us specialize in bitwise operations."*

  It sounds like the goal is to find the only two numbers in each row where one evenly divides the other - that is, where the result of the division operation is a whole number. They would like you to find those numbers on each line, divide them, and add up each line's result.

  For example, given the following spreadsheet:

      5 9 2 8
      9 4 7 3
      3 8 6 5

  * In the first row, the only two numbers that evenly divide are `8` and `2`; the result of this division is `4`.
  * In the second row, the two numbers are `9` and `3`; the result is `3`.
  * In the third row, the result is `2`.

  In this example, the sum of the results would be `4 + 3 + 2 = 9`.

  What is the sum of each row's result in your puzzle input?

  """

  @doc "Yields the answer for day 2, part 1"
  def part_1(string)

  def part_1(input) do
    input |> parse_input |> calculate_checksum
  end

  @doc "Yields the answer for day 2, part 2"
  def part_2(string)

  def part_2(input) do
    input |> parse_input |> calculate_checksum_2
  end

  defp parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn row ->
      row
      |> String.split()
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(fn {x, _} ->
        x
      end)
    end)
  end

  defp combine(collection, k) when is_integer(k) and k >= 0 do
    list = Enum.to_list(collection)
    list_length = Enum.count(list)

    if k > list_length do
      raise Enum.OutOfBoundsError
    else
      do_combine(list, list_length, k, [], [])
    end
  end

  defp do_combine(_list, _list_length, 0, _pick_acc, _acc), do: [[]]
  # optimization
  defp do_combine(list, _list_length, 1, _pick_acc, _acc), do: list |> Enum.map(&[&1])

  defp do_combine(list, list_length, k, pick_acc, acc) do
    list
    |> Stream.unfold(fn [h | t] -> {{h, t}, t} end)
    |> Enum.take(list_length)
    |> Enum.reduce(acc, fn {x, sublist}, acc ->
      sublist_length = Enum.count(sublist)
      pick_acc_length = Enum.count(pick_acc)

      if k > pick_acc_length + 1 + sublist_length do
        # insufficient elements in sublist to generate new valid combinations
        acc
      else
        new_pick_acc = [x | pick_acc]
        new_pick_acc_length = pick_acc_length + 1

        case new_pick_acc_length do
          ^k -> [new_pick_acc | acc]
          _ -> do_combine(sublist, sublist_length, k, new_pick_acc, acc)
        end
      end
    end)
  end

  defp calculate_checksum(input) do
    input
    |> Enum.map(fn row ->
      Enum.max(row) - Enum.min(row)
    end)
    |> Enum.sum()
  end

  defp calculate_checksum_2(input) do
    input
    |> Enum.flat_map(&do_calculate_checksum_2/1)
    |> Enum.sum()
  end

  defp do_calculate_checksum_2(row) do
    Enum.map(combine(row, 2), fn p ->
      [y, x] = Enum.sort(p)

      case rem(x, y) do
        0 -> div(x, y)
        _ -> 0
      end
    end)
  end
end
