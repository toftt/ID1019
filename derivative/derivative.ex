defmodule Derivative do
  @type literal() :: {:const, number()}
                  | {:const, atom()}
                  | {:var, atom()}

  @type expr() :: {:add, expr(), expr()}
               | {:mul, expr(), expr()}
               | literal()

  def deriv({:const, _}, _), do: 0
  def deriv({:var, v}, v), do: 0

end
