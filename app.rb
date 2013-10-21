require 'httparty'
require 'sinatra'

# This is just a simple HTTP library which gives methods for HTTP verbs like `GET` and `POST`.
class GitHub
  include HTTParty
  base_uri 'https://api.github.com'
end

# This is the root path, which has links to the other examples in this file.
#
# If you're running this on your machine, [start here](http://localhost:4567)!
get '/' do
  erb :root
end

# This gets user information and renders it into HTML.
get '/github/users/:username' do
  user = GitHub.get("/users/#{params[:username]}")
  erb :user, :locals => user
end
