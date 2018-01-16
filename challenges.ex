defmodule Challenges do
  def to_binary(n) do to_binary(n, []) end

  defp to_binary(0, b) do b end
  defp to_binary(n, b) do
    div(n, 2) |> to_binary([rem(n, 2)|b])
  end
end
