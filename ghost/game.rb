require_relative "./player.rb"

class Game
  attr_reader :current_player, :previous_player, :dictionary

  def initialize(file_name)
    @fragment = ""
    @players = [Player.new("Kevin"), Player.new("Joe")]
    @dictionary = Game.load_dict(file_name)
    @current_player = @players.first
    @previous_player = nil
  end

  def self.load_dict(file_name)
    hash = Hash.new
    file = File.read(file_name)
    file.split(" ").each do |word|
      hash[word] = true
    end
    hash
  end

  def next_player!
    @players.rotate!
    @current_player = @players.first
    @previous_player = @players.last
  end

  def take_turn(player)
    valid_play = false
    while !valid_play
      temp = player.guess
      if valid_play?(temp)
        @fragment += temp
        valid_play = true
      else
        p "Invalid move, please try again."
      end
    end
  end
 
  def valid_play?(string)
    temp = @fragment + string
    @dictionary.keys.each do |word|
      return true if word.start_with?(temp)
    end
    false
  end
end
