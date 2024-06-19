# taken from https://www.digitalocean.com/community/tutorials/how-to-use-irb-to-explore-ruby
require 'httparty'
class IPGrabber
  def initialize
    @url = "http://icanhazip.com"
  end
  def get
    response = HTTParty.get(@url)
    response.body.chomp # remove the \n if it exists
  end
end
