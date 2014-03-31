require 'yelpster'
require 'json'
require 'hashie'

Yelp.configure(:yws_id          => 'KrxqzFgI2_o4NXjI70ZzoQ',
               :consumer_key    => 'QEptTG25qZDH0T7kjvPrIQ',
               :consumer_secret => 'EwVx4tfHgqD9xE7O2UmovGQkcLA',
               :token           => 'UH5Gsh8OFwdE9g6EFByGz_X2qV8D-lCq',
               :token_secret    => '6fljBtceah2LZ99x_rWKys5nXaE')

# construct a client instance
 client = Yelp::Client.new

 include 
 # perform an address/location-based search for brunch
 request = Yelp::V2::Search::Request::Location.new(
             :city => 'San Francisco',
             :state => 'CA',
             :category_filter => 'breakfast_brunch',
             :term => "sunday",
             :sort => 2,
             :offset => 4)
 response = client.search(request)

obj = Hashie::Mash.new response
# p obj.businesses.first.review_count


brunch_spots = obj.businesses

unpopular_brunch_spots = brunch_spots.select{ |b| b.review_count < 250}

# high_rated_brunch_spots = brunch_spots.sort_by{ |b| b.rating > 3.0 }

p unpopular_brunch_spots.shuffle.last

# http://www.yelp.com/search?find_loc=san+francisco%2C+ca&ns=1#find_desc&start=80&sortby=review_count&attrs=GoodForMeal.brunch&open_time=9390
 

 # http://data.sfgov.org/resource/k4ji-djiq.json