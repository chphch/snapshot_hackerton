require 'net/http'
require 'uri'
require 'nokogiri'
require 'json'
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
    #keys = getKeys(text)
    @keys = "852459"
    @results = findItems(@keys)
  end


  def getKeys(text)
      #topten10
    keys = ""
    if not /([A-Z]){3}\d([A-Z]){2}\d{4}/.match(text).nil?
      keys = /([A-Z]){3}\d([A-Z]){2}\d{4}/.match(text)[0]
      #유니클로
    elsif not /\d{3}-\d{6}/.match(text).nil?
      keys = /\d{3}-\d{6}/.match(text)[0]
      #아디다스
    elsif not /\b[(A-Z)][A-Z|\d]\d{4}\b/.match(text).nil?
      keys = /\b[(A-Z)][A-Z|\d]\d{4}\b/.match(text)[0]
      #나이키
    elsif not /\d{6}( |-)\d{3}/.match(text).nil?
      keys = /\d{6}( |-)\d{3}/.match(text)[0]
    end

  end

  def findItems(key)
=begin
각 함수는 Hash로 구성된 Array를 리턴해야 합니다.
각 Hash는 :title, :link, :mallName, :price를 갖습니다.
=end
    result = searchNaver(key)
    #result = result + searchAuction(key)
    result = result.sort_by { |h| h["price"] }
    return result
  end

  def searchNaver(key)
    uri = URI.parse("https://openapi.naver.com/v1/search/shop.json?query=#{key}&display=10&start=1&sort=sim")
    request = Net::HTTP::Get.new(uri)
    request["X-Naver-Client-Id"] = "FfNTPfd3q0P2hp7qfAoW"
    request["X-Naver-Client-Secret"] = "WzmJjLASgI"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response_result = ActionController::Base.helpers.strip_tags(response.body)
    response_result.gsub! '"lprice"', '"price"'
    search_result = JSON.parse(response_result)
    puts search_result["items"]
    return search_result["items"]
  end

  def searchAuction(key)

  end

end
