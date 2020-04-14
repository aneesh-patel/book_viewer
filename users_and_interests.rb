require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @content = YAML.load_file("users.yaml")
  @count = count_interests
end

get "/" do
  erb :users_home, layout: :users_layout
end

get "/:name" do |n|
  @info_hsh = @content[n.to_sym]
  @name = n
  @email = @info_hsh[:email]
  @interests = @info_hsh[:interests]
  
  erb :users_name, layout: :users_layout
end

helpers do
  def count_interests
    @content = YAML.load_file("users.yaml")
    @user_num = @content.size
    @interest_num = 0
    @content.each do |name, info|
      @interest_num += info[:interests].size
    end
    { users: @user_num, interests: @interest_num }
  end
end