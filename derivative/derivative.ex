defmodule Derivative do
  @type literal() :: {:const, number()}
                  | {:const, atom()}
                  | {:var, atom()}

  @type expr() :: {:add, expr(), expr()}
               | {:mul, expr(), expr()}
               | literal()

  def test() do
    expression = {:mul, {:mul, {:const, 5}, {:var, :x}}, {:add, {:mul, {:const, 5}, {:var, :x}}, {:const, 9}}}
    result = deriv(expression, :x)
    simpl = simplify(result)
    pretty_print(simpl)
  end

  def deriv({:const, _}, _), do: {:const, 0}
  def deriv({:var, v}, v), do: {:const, 1}
  def deriv({:var, y}, _), do: {:var, y}
  def deriv({:mul, e1, e2}, v) do
    {:add, {:mul, deriv(e1, v), e2}, {:mul, e1, deriv(e2, v)}}
  end
  def deriv({:add, e1, e2}, v) do
    {:add, deriv(e1, v), deriv(e2, v)}
  end

  def simplify({:const, c}), do: {:const, c}
  def simplify({:var, v}), do: {:var, v}
  def simplify({:mul, e1, e2}) do
    cond do
      simplify(e1) == {:const, 0} ->
        {:const, 0}
      simplify(e1) == {:const, 1} ->
        simplify(e2)
      simplify(e2) == {:const, 0} ->
        {:const, 0}
      simplify(e2) == {:const, 1} ->
        simplify(e1)
      true ->
        {:mul, simplify(e1), simplify(e2)}
    end
  end
  def simplify({:add, e1, e2}) do
    cond do
      simplify(e1) == {:const, 0} ->
        simplify(e2)
      simplify(e2) == {:const, 0} ->
        simplify(e1)
      true ->
        {:add, simplify(e1), simplify(e2)}
    end
  end


  def pretty_print({:const, n}), do: IO.write("#{n}")
  def pretty_print({:var, v}), do: IO.write("#{v}")
  def pretty_print({op, e1, e2}) do
    pretty_print(e1)
    case op do
      :add -> IO.write("+")
      :mul -> IO.write("*")
    end
    pretty_print(e2)
  end

end
