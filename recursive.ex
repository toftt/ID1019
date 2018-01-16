defmodule Recursive do
  def product(0, _) do 0 end
  def product(m, n) do
    n + product(m - 1, n)
  end

  def exp(_, 0) do 1 end
  def exp(m, n) do
    exp(m, n - 1) |> product(m)
  end

  def exp2(x, 0) do 1 end
  def exp2(x, 1) do x end
  def exp2(x, n) do
    if rem(n, 2) == 0 do
      x * exp2(x, div(n, 2))
    else
      x * exp2(x, n - 1)
    end
  end
end
