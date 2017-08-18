require 'net/http'
require 'uri'


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
    # 채민
    # return an array of strings
  end

  def findItems(keys)
    # 경완 채민
    uri = URI.parse("https://openapi.naver.com/v1/search/shop.xml?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&sort=sim")
    request = Net::HTTP::Get.new(uri)
    request["X-Naver-Client-Id"] = "{A8B3TPKsS8UbC2fWfagt}"
    request["X-Naver-Client-Secret"] = "{sphkVxdYhM}"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # response.code
    # response.body
    # return an array of results
  end

end
