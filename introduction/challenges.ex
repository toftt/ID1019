defmodule Challenges do
  def to_binary(n) do to_binary(n, []) end

  defp to_binary(0, b) do b end
  defp to_binary(n, b) do
    div(n, 2) |> to_binary([rem(n, 2)|b])
  end

  def to_integer(l) do
    x = len(l) - 1
    start = :math.pow(2, x) |> round
    to_integer(l, start)
  end

  defp to_integer([], _) do 0 end
  defp to_integer([h|t], x) do
    h * x + to_integer(t, div(x, 2))
  end

  def fib(n) do fib(n, 0, 1) end

  defp fib(n, a, b) do
    case n do
      0 -> a
      1 -> b
      _ -> fib(n - 1, b, a + b)
    end
  end

  defp len([]) do 0 end
  defp len([_|t]) do 1 + len(t) end
end
