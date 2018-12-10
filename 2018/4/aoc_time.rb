# nodoc
class AocTime
  include Comparable
  DAYS_IN_MONTH = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze
  attr_accessor :year, :month, :day, :hour, :minute

  def initialize(input)
    @year, @month, @day, @hour, @minute = input.scan(/([0-9]+)-([0-9]+)-([0-9]+) ([0-9]+):([0-9]+)/)[0].map(&:to_i)
  end

  def to_s
    "#{@year}-#{@month}-#{@day} #{@hour}:#{@minute}"
  end

  def next_day
    if @day == DAYS_IN_MONTH[@month - 1] # this means a month change
      next_month = @month == 12 ? 1 : @month + 1
      return AocTime.new("#{@year}-#{next_month}-1 00:00")
    end
    AocTime.new("#{@year}-#{@month}-#{@day + 1} 00:00")
  end

  def <=>(other)
    return -1 if @year < other.year
    return  1 if @year > other.year

    return -1 if @month < other.month
    return  1 if @month > other.month

    return -1 if @day < other.day
    return  1 if @day > other.day

    return -1 if @hour < other.hour
    return  1 if @hour > other.hour

    return -1 if @minute < other.minute
    return  1 if @minute > other.minute

    0
  end
end
