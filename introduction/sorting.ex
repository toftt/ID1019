defmodule Sorting do

  def qsort([]) do [] end
  def qsort([p|l]) do
    {a, b} = qsplit(p, l)
    small = qsort(a)
    large = qsort(b)
    append(small, [p|large])
  end

  defp qsplit(p, l) do qsplit(p, l, [], []) end
  defp qsplit(_, [], small, large) do {small, large} end
  defp qsplit(p, [h|t], small, large) do
    if h < p do
      qsplit(p, t, [h|small], large)
    else
      qsplit(p, t, small, [h|large])
    end
  end

  defp append([], []) do [] end
  defp append([h|t], b) do
    [h|append(t, b)]
  end
  defp append(a, [h|t]) do
    [h|append(a, t)]
  end


  def msort([]) do [] end
  def msort([head]) do [head] end
  def msort(l) do
    {a, b} = msplit(l)
    merge(msort(a), msort(b))
  end

  defp merge([], l) do l end
  defp merge(l, []) do l end
  defp merge(m = [a|xa], n = [b|xb]) do
    if a < b do
      [a|merge(xa, n)]
    else
      [b|merge(m, xb)]
    end
  end

  defp msplit(l) do msplit(l, [], []) end
  defp msplit(l, m, n) do
    case l do
      [] ->
        {m, n}
      [a, b|tail] ->
        msplit(tail, [a|m], [b|n])
      [a|tail] ->
        msplit(tail, [a|m], n)
    end
  end

  def isort(l) do isort(l, []) end

  defp isort([], agg) do agg end
  defp isort([head|tail], agg) do
    isort(tail, insert(head, agg))
  end

  defp insert(elem, []) do [elem] end
  defp insert(:done, l) do l end
  defp insert(elem, l = [head|tail]) do
    if elem < head do
      [elem|insert(:done, l)]
    else
      [head|insert(elem, tail)]
    end
  end
end
