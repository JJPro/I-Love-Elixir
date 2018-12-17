defmodule PElixir.String do
  def anagram?(word1, word2) do
    word1_reversed = Enum.reverse(word1)
    word1_reversed == word2
  end
end
