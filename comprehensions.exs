defmodule PElixir.Comprehensions do
  @tax_rates [NC: 0.075, TX: 0.08]
  def order_total(tax_rates \\ @tax_rates, orders) do
    orders_after_tax = Enum.map(orders, fn (order = [_, ship_to: destination, net_amount: net_amount]) ->
      tax_rate = Keyword.get(tax_rates, destination, 0)
      total = net_amount * (1 + tax_rate)
      Keyword.put(order, :total_amount, total)
    end)
  end



  def snippets do
    for <<b1::2, b2::3, b3::3 <- "hello" >>, do: "0#{b1}#{b2}#{b3}"
    for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>
    for <<c <- " hello world ">>, c != ?\s, do: <<c>>
    for <<c <- " hello world ">>, c != ?\s, do: <<c>>, into: ""

  end
end
