# Advent of Code / 2017 / 2 - Spreadsheet

## Important stuff

1. Read entire file line by line to a string:
```ruby
File.foreach('input.txt') do |line|
  # do shit
end
```

2. Split line by tabs to array (mind the double quotes here):
```ruby
line.split("\t")
```

3. Convert each item of array to integer:
```ruby
line.split("\t").map(&:to_i)
```

4. Check if variable is nil:
```ruby
min.nil?
```
It is important to tell that if checking conditional depends of the value of the variable, it needs to check it first on the conditional:
```ruby
if min.nil? || n < min
```

5. Push stuff into the array operator:
```ruby
diffs << (max - min)
```

6. Multiple attribution of the same value:
```ruby
min = max = nil
```

7. Sums all stuff of the array:
```ruby
diffs.inject(0, :+)
```
Can also bee written like this:
```ruby
diffs.reduce(:+)
```
Inject is a reduce-like method: https://ruby-doc.org/core-2.1.0/Enumerable.html#method-i-reduce

8. Check if variable is equals to zero:
```ruby
(i % j).zero? # this
i % j == 0    # is better than this
```
