defmodule Liszt do
  def nth(0, [head|_]) do head end
  def nth(n, [_|tail]) do nth(n - 1, tail) end

  def len(l) do len(l, 0) end
  def len([], c) do c end
  def len([_|tail], c) do len(tail, c + 1) end

  def sum([]) do 0 end
  def sum([head|tail]) do
    head + sum(tail)
  end

  def duplicate([]) do [] end
  def duplicate([head|tail]) do
    [head * 2|duplicate(tail)]
  end

  def add(x, l) do
    if contains(x, l) do
      l
    else
      [x|reverse(l)] |> reverse
    end
  end

  def remove(_, []) do [] end
  def remove(x, [x|tail]) do remove(x, tail) end
  def remove(x, [head|tail]) do
    [head|remove(x, tail)]
  end

  def unique(l) do unique(l, []) end
  def unique([], agg) do reverse(agg) end
  def unique([head|tail], agg) do
    if contains(head, agg) do
      unique(tail, agg)
    else
      unique(tail, [head|agg])
    end
  end

  def pack([]) do [] end
  def pack(list = [x|tail]) do
    [extract(x, list)|remove(x, tail) |> pack]
  end

  def reverse(l) do reverse(l, []) end
  def reverse([], agg) do agg end
  def reverse([head|tail], agg) do
    reverse(tail, [head|agg])
  end

  defp extract(_, []) do [] end
  defp extract(x, [x|tail]) do
    [x|extract(x, tail)]
  end
  defp extract(x, [_|tail]) do
    extract(x, tail)
  end

  defp contains(_, []) do false end
  defp contains(x, [x|_]) do true end
  defp contains(x, [_|tail]) do contains(x, tail) end
end
