for <<b1::2, b2::3, b3::3 <- "hello" >>, do: "0#{b1}#{b2}#{b3}"
for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>
for <<c <- " hello world ">>, c != ?\s, do: <<c>>
for <<c <- " hello world ">>, c != ?\s, do: <<c>>, into: ""
