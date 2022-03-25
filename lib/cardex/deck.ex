defmodule Cardex.Deck do
  alias Cardex.Deck.Card

  defmodule NotFoundError do
    defexception [:message, plug_status: 404]
  end

  use NimblePublisher,
    build: Card,
    from: Application.app_dir(:cardex, "priv/cards/**/*.md"),
    as: :cards,
    highlighters: [:makeup_elixir, :makeup_erlang]

  @cards Enum.sort_by(@cards, & &1.id, :desc)
  @tags @cards |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  def all_cards(), do: @cards
  def all_tags(), do: @tags

  def get_card_by_id!(id) do
    Enum.find(all_cards(), &(&1.id == id)) ||
      raise NotFoundError, "card with id=#{id} not found"
  end

  def get_cards_by_tag!(tag) do
    case Enum.filter(all_cards(), &(tag in &1.tags)) do
      [] -> raise NotFoundError, "cards with tag=#{tag} not found"
      cards -> cards
    end
  end
end
