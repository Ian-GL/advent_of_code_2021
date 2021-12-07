inner_counter =
  %{
    "0" => 0,
    "1" => 0
  }

initial_acc =
  %{
    1 => inner_counter,
    2 => inner_counter,
    3 => inner_counter,
    4 => inner_counter,
    5 => inner_counter,
    6 => inner_counter,
    7 => inner_counter,
    8 => inner_counter,
    9 => inner_counter,
    10 => inner_counter,
    11 => inner_counter,
    12 => inner_counter
  }

counter_acc =
  "input.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.reduce(initial_acc,
      fn binary_term, acc ->
        graphemes = String.graphemes(binary_term)

        graphemes
        |> Enum.with_index(1)
        |> Enum.reduce(acc, fn {val, idx}, acc ->
          update_in(acc[idx][val], &(&1 + 1))
        end)
      end)

# Most common
{gamma_rate_bin, epsilon_rate_bin} =
  counter_acc
  |> Enum.reduce({"", ""}, fn {_k, v}, acc ->
    if v["0"] > v["1"] do
      {elem(acc, 0) <> "0", elem(acc, 1) <> "1"}
    else
      {elem(acc, 0) <> "1", elem(acc, 1) <> "0"}
    end
  end)
  # |> Integer.parse(2)

{gamma_rate, _} = Integer.parse(gamma_rate_bin, 2)
{epsilon_rate, _} = Integer.parse(epsilon_rate_bin, 2)

gamma_rate * epsilon_rate
|> IO.inspect()
