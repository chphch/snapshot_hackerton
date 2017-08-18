require 'google/cloud/vision'  
require 'googleauth'           


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

  def put_image
    file_data = params[:file]
    @result = ocr(file_data.path)                                                                                         
  end

  def search
  end
end
