defmodule Cardex.Deck.Card do
  @enforce_keys [:id, :topic, :question, :answer, :tags]
  defstruct [:id, :topic, :question, :answer, :tags]

  def build(filename, attrs, body) do
    [topic, id] = filename |> Path.rootname() |> Path.split() |> Enum.take(-2)
    struct!(__MODULE__, [id: id, topic: topic, question: body] ++ Map.to_list(attrs))
  end
end
