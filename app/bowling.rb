class Bowling
  def initialize turns
    @turns = turns
  end

  def score
    total = 0
    @turns.each_with_index do |turn, index|
      break if index > 9
      next_turn = @turns[index+1]
      next_next_turn = @turns[index+2]
      
      if turn.strike?
        if next_turn.strike?
          total += turn.total + next_turn.throw1 + next_next_turn.throw1
        else
          total += turn.total + next_turn.total
        end
      elsif turn.spare?
        total += turn.total + next_turn.throw1
      else
        total += turn.total
      end
    end
    return total
  end
end