require 'google/cloud/vision'  
require 'googleauth'           
require 'nokogiri'
require 'open-uri'

class MainController < ApplicationController
  def index
  end


  def ocr(file)
    # Google Vision API                                                                                                   
    project_id = 'snapshop'                                                                                               
    scopes =  ['https://www.googleapis.com/auth/cloud-platform', 'https://www.googleapis.com/auth/devstorage.read_only']  
    authorization = Google::Auth.get_application_default(scopes)                                                          
    vision = Google::Cloud::Vision.new project: project_id
    image = vision.image(file)
    Rails.logger.debug("image.label = #{image.label}")                                                                    
    return image.text                                                                                                     

  end

  def put_image(image)
    # file_data = params[:file]
    # @result = ocr(file_data.path)                                                                                         
  end



  def search
    image = params[:image]
    # Do something with image
    # put_image(image)
    @result = ocr(image.path)
    render "put_image"
  end

  def auction
    doc = Nokogiri::HTML(open('http://search.auction.co.kr/search/search.aspx?keyword=MSX2PP1008&itemno=&nickname=&frm=hometab&dom=auction&isSuggestion=No&retry=&Fwk=MSX2PP1008&acode=SRP_SU_0100&arraycategory=&encKeyword=MSX2PP1008'))

    itemArray = Array.new
    list_view = doc.css(".list_view")
    list_view.each do |x|
      item = Hash.new
      item[:image]=x['src']
      item[:title]=x.css('.item_title').text
      item[:price]=x.css('.item_price strong').text


      puts "what i want to show"

      itemArray.push(item)
    end
  end

end
