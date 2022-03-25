%{
  tags: ~w(),
  answer: "=> \"That's many cooks\""
}
---
```elixir
String.replace(
  "Too many cooks",
  "oo",
  "hat's",
  global: false
)
```
