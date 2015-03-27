require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'imdb'

results = ''

get '/movies/search' do
  erb :search
end

post '/movies/search' do
  results = Imdb::Search.new(params[:one_word])
  redirect to('movies/display')
end

get '/movies/display' do
  @results = results.movies.take(20)
  erb :display
end

