defmodule Huffman do
  def sample() do
    "the quick brown fox jumps over the lazy dog this is a sample text that we will use when we build up a table we will only handle lower case letters and no punctuation symbols the frequency will of course not represent english but it is probably not that far off"
  end

  def test() do
    char_list = sample() |> String.graphemes
    freq(char_list)
  end

  def freq(sample), do: Enum.reduce sample, %{}, fn(char, acc) ->
    Map.update(acc, char, 1, &(&1 + 1))
  end

end
