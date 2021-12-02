"input.txt"
|> File.read!()
|> String.split("\n")
|> Enum.reduce({0,0}, fn val, {acc, prev} ->
  {current_val, _} = Integer.parse(val)

  new_acc =
    if current_val > prev do
      acc + 1
    else
      acc
    end

  {new_acc, current_val}
end)
|> elem(0)
|> Kernel.-(1)
|> IO.inspect()
