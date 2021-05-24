%{
  tags: ~w(),
  answer: "=> hey"
}
---
```elixir
cond do
  2 + 2 == 5 -> "boo"
  2 * 2 == 3 -> "foo"
  1 + 1 == 2 -> "hey"
end
```
