class SimpleEncrypt

  # MORSE = {"a" => ".-", "b" => "-...", "c" => "-.-.", "d" => "-..", "e" => ".", "f" => "..-.", "g" => "--.", "h" => "....",
  # "i" => "..", "j" => ".---", "k" => "-.-", "l" => ".-..", "m" => "--", "n" => "-.", "o" => "---", "p" => ".--.", "q" => "--.-",
  # "r" => ".-.", "s" => "...", "t" => "-", "u" => "..-", "v" => "...-", "w" => ".--", "x" => "-..-", "y" => "-.--", "z" => "--.."}
  #
  # REVERSAL = {"a" => "z", "b" => "y", "c" => "x", "d" => "w", "e" => "v", "f" => "u", "g" => "t", "h" => "s",
  # "i" => "r", "j" => "q", "k" => "p", "l" => "o", "m" => "n", "n" => "m", "o" => "l", "p" => "k", "q" => "j",
  # "r" => "i", "s" => "h", "t" => "g", "u" => "f", "v" => "e", "w" => "d", "x" => "c", "y" => "b", "z" => "a"}
  #
  # NUMERIC = {"a" => "1", "b" => "2", "c" => "3", "d" => "4", "e" => "5", "f" => "6", "g" => "7", "h" => "8",
  # "i" => "9", "j" => "10", "k" => "11", "l" => "12", "m" => "13", "n" => "14", "o" => "15", "p" => "16", "q" => "17",
  # "r" => "18", "s" => "19", "t" => "20", "u" => "21", "v" => "22", "w" => "23", "x" => "24", "y" => "25", "z" => "26"}

  attr_reader :lib, :seed

  def initialize(lib = {})
    @lib = lib
  end

  def create_lib(seed = rand(0..9999999))
    @seed = seed
    srand @seed
    "a".upto("z") { |el| add_val(el) }
    "A".upto("Z") { |el| add_val(el) }
    "0".upto("9") { |el| add_val(el) }
    %w(? . ! > < ( ) [ ] $ & % # * + - = _).each { |el| add_val(el) }
  end

  def encode(str)
    str.split(" ").map { |word| encode_word(word) }.join
  end

  def decode(str, seed = @seed)
    create_lib(seed) if @lib.empty?
    str.split("  ").map { |word| decode_word(word) }.join(" ")
  end

  private

  def add_val(letter)
    num = rand(100000..999999)
    @lib.value?(num) ? add_val(letter) : (@lib[letter] = num.to_s)
  end

  def decode_word(word)
    word.split(" ").map { |c| @lib.key(c) if @lib.value?(c) }.join
  end

  def encode_word(word)
    word.split(//).map { |c| @lib[c] + " " if @lib.key?(c) }.join + " "
  end

end
