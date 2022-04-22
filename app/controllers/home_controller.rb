class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=0&API_KEY=B1A4D529-44F7-41A0-9030-ABE442293A62'
    @uri = URI(@url)
    @response= Net::HTTP.get(@uri)
    @output=JSON.parse(@response) 

  

   if @output.empty?
    @final_output="Error" 
   else
     @final_output=@output[0]['AQI']
   end  
  end
end
