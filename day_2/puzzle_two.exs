{horizontal_position, final_depth, _final_aim} =
  "input.txt"
  |> File.read!()
  |> String.split("\n")
  |> Enum.reduce({0,0,0},
    fn directions, {x_acc, y_acc, aim_acc} ->
      [direction, val] = String.split(directions, " ")
      {val, _} = Integer.parse(val)

      case direction do
        "forward" ->
          depth_increase = aim_acc * val
          {x_acc + val, y_acc + depth_increase, aim_acc}

        "down" ->
          {x_acc, y_acc, aim_acc + val}

        "up" ->
          {x_acc, y_acc, aim_acc - val}

        _ ->
          raise "Invalid direction"
      end
    end)

horizontal_position * final_depth
|> IO.inspect()
