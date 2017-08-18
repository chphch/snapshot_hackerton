require 'net/http'
require 'uri'
require 'nokogiri'
require 'json'


class MainController < ApplicationController
  def index
  end

  def search
    image = params[:image]
    # Do something with image

    text = ocr(image)
    keys = getKeys(text)
    @result = findItems(keys)
  end

  def ocr(image)
    # 경완
    # return string
  end




  def getKeys(text)
      #array


  end

  def findItems(keys)

    # 경완 채민
    uri = URI.parse("https://openapi.naver.com/v1/search/shop.json?query=852459&display=10&start=1&sort=sim")
    request = Net::HTTP::Get.new(uri)
    request["X-Naver-Client-Id"] = "FfNTPfd3q0P2hp7qfAoW"
    request["X-Naver-Client-Secret"] = "WzmJjLASgI"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response_result = response.body
    # return an array of results
    # puts response_result
    search_result = JSON.parse(response_result)
    return search_result["items"]

    # puts items"items"
    # procuct_title = items[:title]
    # puts procuct_title
  end

end
