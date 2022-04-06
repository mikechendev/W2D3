require 'byebug'
class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |el| POSSIBLE_PEGS.include?(el.upcase) }
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map { |el| el.upcase }
    else
      raise 'invalid pegs'
    end
  end

  def self.random(n)
    arr = []
    while arr.length < n
      arr << POSSIBLE_PEGS.keys.sample
    end
    self.new(arr)
  end

  def self.from_string(str)
    arr = str.split('').map { |el| el.upcase }
    self.new(arr)
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    @pegs.each_with_index do |peg1, i|
      guess.pegs.each_with_index do |peg2, j|
        count += 1 if peg1 == peg2 && i == j
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    new_pegs = @pegs.dup
    new_guess = guess.pegs.dup

    new_pegs.each_with_index do |peg1, i|
      new_guess.each_with_index do |peg2, j|
        if peg1 == peg2 && i == j
          new_pegs[i] = nil
          new_guess[i] = nil
        end
      end
    end

    new_pegs.each_with_index do |peg1, i|
      if new_guess.include?(peg1) && peg1 != nil
        idx = new_guess.index(peg1)
        new_guess[idx] = nil
        count += 1
      end
    end
    count
  end

  def ==(instance)
    @pegs == instance.pegs
  end

end
