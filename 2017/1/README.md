# Advent of Code / 2017 / 1 - Captcha

## Important stuff

1. Read entire file to a string:
```ruby
number = File.read('entrada1.txt')
```

2. Simple syntax for a `while` loop:
```ruby
loop do
  # ... do shit
  break if condition
end
```

3. To strip `EOL`, `EOF` and shit from input use `String.strip`:
```ruby
number = File.read('entrada2.txt').strip
```

4. String concatenation operator:
```ruby
number = number << number
```
