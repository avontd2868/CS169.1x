class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


  
  def rps_result(m1, m2)
  	if (m1.last == m2.last) then
  		return m1
  	end
  	if (m1.last == 'P' && m2.last == 'R' ||
    	m1.last == 'S' && m2.last == 'P' ||
      m1.last == 'R' && m2.last == 'S') then
      return m1
    end
    return m2
  end

	def rps_game_winner(game)
  	raise WrongNumberOfPlayersError if game.length != 2
    game.each { |v| raise NoSuchStrategyError unless v.last.match(%Q{[PRS]}) }
	

    return rps_result(game.first,game.last)
	end

def rps_tournament_winner(tournament)
    begin 
        return rps_game_winner(tournament)
    rescue
        winner1 = rps_tournament_winner(tournament.first)
        winner2 = rps_tournament_winner(tournament.last)

        return rps_game_winner([winner1, winner2])
    end
end
