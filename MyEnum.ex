defmodule MyEnum do
  def all?([], _), do: false
  def all?([hd|tl], func), do: _all?(tl, func.(hd), func)
  defp _all?([], acc, _func), do: acc
  defp _all?([hd|tl], acc, func), do: _all?(tl, acc and func.(hd), func)


  def each(list, func), do: _each(list, [], func)
  defp _each([], acc, _), do: acc
  defp _each([hd|tl], acc, func), do: _each(tl, acc ++ [func.(hd)], func)

  def filter([], _), do: []
  def filter([hd|tl], func) do
    if func.(hd) do
      [hd | filter(tl, func)]
    else
      filter(tl, func)
    end
  end

  def split(list, count), do: _split(list, {[], []}, count)
  defp _split([], {left, right} = acc, _count), do: {Enum.reverse(left), Enum.reverse(right)}
  defp _split(list, {left, right} = acc, 0), do: {Enum.reverse(left), Enum.reverse(right)}
  defp _split([hd|tl], {left, right}, count), do: _split(tl, {[hd|left], tl}, count-1)

  def take(list, n) do
    {left, right} = split(list, n)
    left
  end

  def flatten([]), do: []
  def flatten([hd|tl]), do: flatten(hd) ++ flatten(tl)
  def flatten(hd), do: [hd]

  def span(from, to) when from < to, do: [from | span(from + 1, to)]
  def span(from, to) when from == to, do: [from]

  def prime_to(n) do
    range = span(2, n)
    range -- (for n1 <- range, n2 <- range, n1 <= n2, n1 * n2 <= n, do: n1 * n2)
  end
end
