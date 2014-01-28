class DiceController < ApplicationController

  @url_roll = '/dice/roll?goal=<%=@goal%>&firstmove=<%=@first_move%>'

  def new_game()
    @goal=0
    @first_move='true'
    render "newgame"
  end

  def new_roll()
    #get parameters
    @first_move = params[:firstmove]
    @goal = params[:goal].to_i

    #roll the dice
    @d1 = 1+rand(6)
    @d2 = 1+rand(6)
    roll = @d1+@d2

    #render appropriate page based on the roll
    if @first_move
      @goal = roll
      case roll
      when 2, 3, 12
        render "lose"
      when 7,11
        render "win"
      else
        render "roll"
      end
    else
      case roll
      when @goal
        render "win"
      when 7
        render "lose"
      else
        render "roll"
      end
    end


  end

end