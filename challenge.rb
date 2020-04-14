require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.glob("*.*")
  erb :files
end

get "/reverse" do
  @files = Dir.glob("*.*")
  erb :reverse_file
end

get "/:name" do
  @file_name = params['name']
  @content = File.read("#{@file_name}")
  erb :file
end

