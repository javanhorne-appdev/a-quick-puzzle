class PagesController < ApplicationController
  def puzzle
    if session.fetch(:user_guess) != nil
      @guess = session.fetch(:user_guess)
    end
    if cookies.fetch(:final_guess) != nil
      @final_guess = cookies.fetch(:final_guess)
    end
    render({ :template => "pages/puzzle.html.erb" })
  end
  
  def write_cookie
    #Parameters: {"first_num"=>"1", "second_num"=>"2", "third_num"=>"3"}

    # if session.fetch.keys.exclude?(":master")
    #   session.store(:master, [])
    # end

    

    if session.fetch(:user_guess)==nil
      session.store(:user_guess, [])  
    end
    guess = session.fetch(:user_guess)
    
    guess.push(params)

    session.store(:user_guess, guess)


    redirect_to("/")
  end

  def write_cookie2
    #Parameters: {"first_num"=>"1", "second_num"=>"2", "third_num"=>"3"}


    cookies.store(:final_guess, params.fetch("final_rule"))
    redirect_to("/")
  end
end
