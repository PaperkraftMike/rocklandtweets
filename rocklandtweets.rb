require 'twitter'
require 'sinatra'
require 'haml'

Twitter.configure do |config|
  config.consumer_key = "icuRhowpxFhNAlk418ZvA"
  config.consumer_secret = "JqJ3x6YNBuzCttixmvnxHZ4XtOzJkK0Nna91pNDPQA"
  config.oauth_token = "18829543-yUNWrIn3z0HaiEAo1D8PHBWRmRxWaX8MfbnSosFp4"
  config.oauth_token_secret = "5CeCXHzrpW8b7nPl4ncWZGW1oZVpZG2YMslFO2dE"
end
                    

get '/' do
	@search = Twitter.search("rockland county", count: 10, result_type: "recent")  
  haml :index
end
