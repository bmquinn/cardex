%{
  tags: ~w(),
  answer: "=> true"
}
---
```elixir
foo = fn a, b -> a +b
      end
is_function(foo, 2)
```