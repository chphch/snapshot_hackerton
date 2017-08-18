require 'net/http'
require 'uri'
require "nokogiri"


class MainController < ApplicationController
  def index
  end

  def search
    image = params[:image]
    # Do something with image


    uri = URI.parse("https://openapi.naver.com/v1/search/shop.json?query='852459'&display=10&start=1&sort=sim")
    request = Net::HTTP::Get.new(uri)
    request["X-Naver-Client-Id"] = "{FfNTPfd3q0P2hp7qfAoW}"
    request["X-Naver-Client-Secret"] = "{WzmJjLASgI}"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end
end
