defmodule Aoc2020Day12 do
  import Enum

  def solve1(input) do
    input
    # TODO
  end

  def solve2(input) do
    actions =
      input
      |> String.trim()
      |> String.split("\n", trim: true)
      |> map(&parse_line(&1))

    # |> IO.inspect

    # [h|t] = actions
    # move(t, {{0,0}, "E"})

    r =
      actions
      |> reduce({{0, 0}, {10, -1}, "E"}, fn x, acc ->
        # IO.inspect({x, acc})
        move(x, acc)
      end)

    # IO.inspect(r)

    {{sx, sy}, {_x, _y}, _} = r
    abs(sx) + abs(sy)
  end

  @doc """
  Action N means to move north by the given value.
  Action S means to move south by the given value.
  Action E means to move east by the given value.
  Action W means to move west by the given value.
  Action L means to turn left the given number of degrees.
  Action R means to turn right the given number of degrees.
  Action F means to move forward by the given value in the direction the
  """
  def parse_line("N" <> value), do: {"N", String.to_integer(value)}
  def parse_line("S" <> value), do: {"S", String.to_integer(value)}
  def parse_line("E" <> value), do: {"E", String.to_integer(value)}
  def parse_line("W" <> value), do: {"W", String.to_integer(value)}
  def parse_line("L" <> value), do: {"L", String.to_integer(value)}
  def parse_line("R" <> value), do: {"R", String.to_integer(value)}
  def parse_line("F" <> value), do: {"F", String.to_integer(value)}

  def move([], state) do
    state
  end

  def move({"N", v}, {{sx, sy}, {x, y}, direction}) do
    {{sx, sy}, {x, y - v}, direction}
  end

  def move({"S", v}, {{sx, sy}, {x, y}, direction}) do
    {{sx, sy}, {x, y + v}, direction}
  end

  def move({"W", v}, {{sx, sy}, {x, y}, direction}) do
    {{sx, sy}, {x - v, y}, direction}
  end

  def move({"E", v}, {{sx, sy}, {x, y}, direction}) do
    {{sx, sy}, {x + v, y}, direction}
  end

  def move({"L", v}, {{sx, sy}, {x, y}, direction}) do
    {{nx, ny}, _} = rotate({x, y}, "L", v)
    {{sx, sy}, {nx, ny}, direction}
  end

  def move({"R", v}, {{sx, sy}, {x, y}, direction}) do
    {{nx, ny}, _} = rotate({x, y}, "R", v)
    {{sx, sy}, {nx, ny}, direction}
  end

  def move({"F", v}, {{sx, sy}, {x, y}, d}) do
    {{sx + x * v, sy + y * v}, {x, y}, d}
  end

  # def move({"F", v} , {{x, y}, "N"}) do
  #  {{x, y-v}, "N"}
  # end
  # def move({"F", v} , {{x, y}, "S"}) do
  #  {{x, y+v}, "S"}
  # end
  # def move({"F", v} , {{x, y}, "W"}) do
  #  {{x-v, y}, "W"}
  # end
  # def move({"F", v} , {{x, y}, "E"}) do
  #  {{x+v, y}, "E"}
  # end

  def rotate({x, y}, "R", degree) do
    case degree do
      90 -> {{-y, x}, "nah"}
      180 -> {{-x, -y}, "nah"}
      270 -> {{y, -x}, "nah"}
    end
  end

  def rotate({x, y}, "L", degree) do
    case degree do
      90 -> {{y, -x}, "nah"}
      180 -> {{-x, -y}, "nah"}
      270 -> {{-y, x}, "nah"}
    end
  end

  # def rotate(c, d, degree) do
  #  xs = ["N", "W", "S", "E"]
  #  idx = find_index(xs, &(&1 == c))
  #  degree = trunc(degree / 90)
  #  case d do
  #    "L" ->
  #      r = at(xs, rem(idx + degree + 4, 4))
  #      IO.inspect({"rotating",c, d, degree, r})
  #      r
  #    "R" -> at(xs, rem(idx - degree + 4, 4))
  #  end
  # end
end
