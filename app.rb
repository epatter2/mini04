require 'sinatra'
require 'json'
require './lib/Excel.rb'

enable :sessions

get '/' do
  if session['login']
  return "You are logged in!"
  else
  return "You are not logged in!"
  end
end

post '/msg' do
  return params['song'] + ": " + params['msg'] 
end

get '/names' do
  return JSON.generate(["larry","moe","johnny"])
end

post '/login' do
  session['login'] = true
  return "You are logged in!"
end

get '/secret' do
  if session['login']
    return "The secret is 42"
  else
    return "Go away! You are not logged in and you stinketh"
  end
end

get '/excel' do
  
  if session['login']
    my_h = { params['number'] => Excel.new.alph(params['number'].to_i) }
    return JSON.generate(my_h)
  else
    return "You are not logged in!"
  end
end