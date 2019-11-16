# app.rb
require 'sinatra'

set :bind, '0.0.0.0'
#set :port, 80

get '/' do
  t = Time.now;
  t.strftime("%Y/%m/%d %I:%M%p") 
 #  "Hello world!"
end