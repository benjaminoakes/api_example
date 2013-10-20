require 'httparty'
require 'sinatra'

class GitHub
  include HTTParty
  base_uri 'https://api.github.com'
end

get '/' do
  erb :root
end

get '/github/users/:username' do
  user = GitHub.get("/users/#{params[:username]}")
  erb :user, :locals => user
end
