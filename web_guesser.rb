require 'sinatra'
require 'sinatra/reloader'

set :num, rand(100)
message = ""

get '/' do

  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => settings.num, :message => message}
  
end

def check_guess(guess)
  if guess == nil
    message = ""
  elsif guess.to_i > (settings.num + 5)
    message = "WAY Too High!"
  elsif guess.to_i > settings.num
    message = "Too High!"
  elsif guess.to_i < (settings.num - 5)
    message = "WAY Too Low!"
  elsif guess.to_i < settings.num
    message = "Too Low!"
  else
    message = "YOU GOT IT!"
  end
end
