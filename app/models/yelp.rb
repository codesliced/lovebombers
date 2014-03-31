require 'rubygems'
require 'oauth'
require 'json'

consumer_key = 'QEptTG25qZDH0T7kjvPrIQ'
consumer_secret = 'EwVx4tfHgqD9xE7O2UmovGQkcLA'
token = 'UH5Gsh8OFwdE9g6EFByGz_X2qV8D-lCq'
token_secret = '6fljBtceah2LZ99x_rWKys5nXaE'

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

path = "/v2/search?term=restaurants&categories=brunch&location=san%20francisco"

# path = "/v2/search/term=brunch&location=san%20francisco"

# p access_token.get(path).body

brunch_restos = access_token.get(path).body
# brunch_restos.delete! '\\\'
# p brunch_restos

restaurants = JSON.parse(brunch_restos)
p restaurants


