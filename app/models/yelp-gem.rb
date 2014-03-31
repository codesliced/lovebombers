require 'yelp'

client = Yelp::Client.new
   request = Yelp::Review::Request::Location.new(
                :address => '650 Mission St',
                :city => 'San Francisco',
                :state => 'CA',
                :radius => 2,
                :term => 'cream puffs',
                :yws_id => 'KrxqzFgI2_o4NXjI70ZzoQ')
   response = client.search(request)