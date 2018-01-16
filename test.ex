defmodule Test do
  def double(n) do
    n * 2
  end

  def fahrenheitToCelsius(n) do
    (n - 32) / 1.8
  end

  def rectArea(a, b) do
    a * b
  end

  def squareArea(n) do
    rectArea(n, n)
  end

  def circleArea(radius) do
    :math.pow(radius, 2) * 3.14
  end
end
