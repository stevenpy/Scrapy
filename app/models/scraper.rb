require "net/http"

class Scraper
  attr_reader :doc

  def initialize(url)
    response = Net::HTTP.get(URI.parse(url))
    @doc = Nokogiri::HTML(response)
  end

  def text(selector:)
    doc.at_css(selector).text
  end

  def present?(selector:)
    doc.at_css(selector).present?
  end
end
