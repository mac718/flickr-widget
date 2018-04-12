class StaticPagesController < ApplicationController
  def home
    base_url = "https://api.flickr.com/services/rest/?method="
    api_key = ENV['flickr_api_key']

    if params[:photostream]
      user_name = params[:photostream][:id] 
      user_id = 
      HTTParty.get("#{base_url}flickr.people.findByUsername&&api_key=#{api_key}&username=#{user_name}&format=rest")['rsp']['user']['id']
      
      
      


      #FlickRaw.api_key = Figaro.env.flikr_api_key
      #FlickRaw.shared_secret = Figaro.env.flickr_secret 
      @photos = HTTParty.get("#{base_url}flickr.people.getPublicPhotos&api_key=#{api_key}&user_id=#{user_id}&format=rest")
    end
  end
end
