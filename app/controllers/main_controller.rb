require 'net/http'
require 'uri'
require "nokogiri"
require 'google/cloud/vision'
require 'googleauth'


class MainController < ApplicationController
  def index
  end

  def ocr(file)
    path = file.path
    # Google Vision API
    project_id = 'snapshop'
    scopes =  ['https://www.googleapis.com/auth/cloud-platform', 'https://www.googleapis.com/auth/devstorage.read_only']
    authorization = Google::Auth.get_application_default(scopes)
    vision = Google::Cloud::Vision.new project: project_id
    image = vision.image(path)
    Rails.logger.debug("image.label = #{image.label}")
    return image.text
  end

  def search
    image = params[:image]
    # Do something with image

    text = ocr(image)
    keys = getKeys(text)
    @result = findItems(keys)
  end

  def getKeys(text)
    # 채민
    # return an array of strings
  end

  def findItems(keys)
    # 경완 채민
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
    # response.code
    # response.body
    # return an array of results
  end

end
