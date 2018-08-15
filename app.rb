require 'sinatra'
#require 'sinatra/reloader'

SECRET_NUM = rand(100) #sets the secret number to a constant
message = ""
@@guess_num = 6


get '/' do
  
  guess = params["guess"]
  message = check_guess(guess)
  background = background_changer(guess)
  @@guess_num -= 1
  if @@guess_num == 1
    guess_message = "GAME OVER"
    @@guess_num = 6
    SECRET_NUM = rand(100)
  else
    guess_message = "You have #{@@guess_num} guesses left!"
  end
  erb :index, :locals => {:number => SECRET_NUM, :message => message, :background => background, :guess_message => guess_message}
  
end

def check_guess(guess)
  if guess == nil
    message = ""
  elsif guess.to_i > (SECRET_NUM + 5)
    message = "WAY Too High!"
  elsif guess.to_i > SECRET_NUM
    message = "Too High!"
  elsif guess.to_i < (SECRET_NUM - 5)
    message = "WAY Too Low!"
  elsif guess.to_i < SECRET_NUM
    message = "Too Low!"
  else
    message = "YOU GOT IT!"
  end
end

def background_changer(guess)
  if guess == nil
    background = 'white'
  elsif guess.to_i > (SECRET_NUM + 5)
    background = '#ff0000'
  elsif guess.to_i > SECRET_NUM
    background = '#e6e600'
  elsif guess.to_i < (SECRET_NUM - 5)
    background = '#ff0000'
  elsif guess.to_i < SECRET_NUM
    background = '#e6e600'
  else
    background = '#33cc33'
  end
end
