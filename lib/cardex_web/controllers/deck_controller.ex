defmodule CardexWeb.DeckController do
  use CardexWeb, :controller

  alias Cardex.Deck

  def index(conn, _params) do
    render(conn, "index.html", cards: Deck.all_cards())
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", card: Deck.get_card_by_id!(id))
  end
end
