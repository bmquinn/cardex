defmodule CardexWeb.PageControllerTest do
  use CardexWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Listing all cards"
  end
end
