defmodule Huffman do
  def sample() do
    "the quick brown fox jumps over the lazy dog this is a sample text that we will use when we build up a table we will only handle lower case letters and no punctuation symbols the frequency will of course not represent english but it is probably not that far off"
  end

  def text(), do: "this is something we should encode all day long my friends" |> String.graphemes

  def test() do
    char_list = sample() |> String.graphemes
    huff_tree = freq(char_list) |> tree
    char_map = traverse(huff_tree)
    encoded = text() |> encode(char_map)
    decode(encoded, huff_tree) |> Enum.reduce(fn(char, acc) -> acc <> char end)
  end

  def freq(sample) do
    map = Enum.reduce sample, %{}, fn(char, acc) ->
      Map.update(acc, char, 1, &(&1 + 1))
    end
    map |> Map.to_list |> List.keysort(1)
  end

  def tree([t]), do: t
  def tree([a = {_, f1}, b = {_, f2}|rest]) do
    [{{a, b}, f1 + f2}|rest] |> List.keysort(1) |> tree
  end

  def traverse(tree), do: traverse(tree, []) |> Map.new
  
  def traverse({{left, right}, _f}, acc) do
    traverse(left, [0|acc]) ++ traverse(right, [1|acc])
  end
  def traverse({char, _}, acc), do: [{char, Enum.reverse(acc)}]

  def encode([], _map), do: []
  def encode([h|t], map) do
    Map.get(map, h) ++ encode(t, map)
  end

  def decode(text, tree), do: decode(text, tree, tree)

  def decode([h|t], tree, {{left, right}, _}) do
    case h do
      0 -> decode(t, tree, left)
      1 -> decode(t, tree, right)
    end
  end
  def decode([], _, {char, _}), do: [char]
  def decode(text, tree, {char, _}), do: [char|decode(text, tree, tree)]

end
