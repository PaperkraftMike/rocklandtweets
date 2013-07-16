require 'rubygems'
require 'twitter'
require 'sinatra'
require 'haml'
require 'twitter-text'
require 'sinatra/activerecord'
require 'omniauth-twitter'
include Twitter::Autolink
require './models'

use OmniAuth::Builder do 
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
end

configure do 
  enable :sessions
end

helpers do 
  def admin?
    session[:admin] 
  end
end


Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end

get '/login' do
  redirect to ('/auth/twitter')
end

get '/auth/twitter/callback' do
  @ident = env['omniauth.auth']['credentials'].token
  session[:admin] = true
  session[:username] = env['omniauth.auth']['info'].nickname
  session[:picture] = env['omniauth.auth']['info'].image
  session[:location] = env['omniauth.auth']['info'].location
  redirect to ('/loggedin')
end


get '/loggedin' do
  @user_search = Twitter.search(session[:location], count: 10, result_type: "recent")

  haml :loggedin
end

get '/auth/failure' do
  params[:message]
end

get '/index' do
	@search = Twitter.search("rockland county", count: 10, result_type: "recent")  
  haml :index
end

get '/ramapo' do
  @ramapo_search = Twitter.search("ramapo", count: 10, result_type: "recent")
  haml :ramapo
end

get '/nyack' do
  @nyack_search = Twitter.search("nyack", count: 10, result_type: "recent")
  haml :nyack
end

get '/orangetown' do
  @orangetown_search = Twitter.search("orangetown", count: 10, result_type: "recent")
  haml :orangetown
end

get '/stony_point' do
  @stony_point_search = Twitter.search("stony point", count: 10, result_type: "recent")
  haml :stony_point
end

get '/haverstraw' do
  @haverstraw_search = Twitter.search("haverstraw", count: 10, result_type: "recent")
  haml :haverstraw
end

get '/search' do
  @search_search = Twitter.search(params[:input] + " rockland county", count: 10, result_type: "recent")
  haml :search
end




