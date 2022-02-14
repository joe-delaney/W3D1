class Player
  def initialize(name)
    @name = name
  end

  def guess
    invalid_guess = false
    while !invalid_guess
      puts "Guess a letter"
      letter = gets.chomp.downcase
      invalid_guess = alert_invalid_guess?(letter)
    end
    letter
  end

  def alert_invalid_guess?(str)
    alphabet = ("a".."z").to_a
    if str.length > 1 || str.length < 1 || !alphabet.include?(str)
      puts "Invalid guess"
      return false
    else
      return true
    end
  end
end