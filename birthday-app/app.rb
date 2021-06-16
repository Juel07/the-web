require "sinatra"
require "sinatra/reloader" if development?

configure :production do
  enable :reloader
end

get "/" do # form
  erb :index
end

get "/birthday" do # birthday greetings
  @name = params[:name]
  erb :user_birthday
end

get "/reminder" do # birthday is in X days
  @name = params[:name]
  erb :reminder
end
