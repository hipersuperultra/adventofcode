# Advent of Code / 2017 / 6 - Memory

## Important stuff

1. Cloning array before insert into another array. This will create a new copy
of it in memory instead of reference it on the container array:
```ruby
memory_configs << memory.clone
```

2. Iterating circularly in the bounds of an array:
```ruby
pointer = (pointer + 1) % memory.size
```
