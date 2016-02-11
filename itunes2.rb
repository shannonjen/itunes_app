require 'net/http'
require 'json'

class ITunes
  @@url = "https://itunes.apple.com/"
  def self.search term
    url = "#{@@url}search?term=#{term}"
    get_response url
  end

  def self.get_response url
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    parsed["results"]
  end

  private_class_method :get_response
end
