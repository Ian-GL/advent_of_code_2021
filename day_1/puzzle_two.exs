"input.txt"
|> File.read!()
|> String.split("\n")
|> Enum.reduce({0, [nil, nil, nil]}, fn val, {acc, prev_triade} ->
  {current_val, _} = Integer.parse(val)

  new_triade =
    prev_triade
    |> List.delete_at(0)
    |> List.insert_at(2, current_val)

  unless Enum.any?(prev_triade, &is_nil/1) do
    prev_sum = Enum.reduce(prev_triade, 0, &Kernel.+(&1, &2))
    new_triade_sum = Enum.reduce(new_triade, 0, &Kernel.+(&1, &2))

    new_acc =
      if new_triade_sum > prev_sum do
        acc + 1
      else
        acc
      end

    {new_acc, new_triade}
  else
    {acc, new_triade}
  end
end)
|> elem(0)
|> IO.inspect()
