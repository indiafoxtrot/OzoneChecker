class HomeController < ApplicationController
  def index
    require 'net/http'
    require'json'

    @url ='http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=11421&distance=0&API_KEY=FDC69977-1840-4DDC-BC12-C5138B6C32BD'
    @uri = URI(@url)
    @responde = Net::HTTP.get(@uri)
    @output = JSON.parse(@responde)
    @area_location = @output[1]['ReportingArea']

      #Check empty result
  if @output.empty?
    @final_output = "Please Insert a Valid Postal Code"
  elsif !@output
    @final_output = "You haven't insert a Postal Code"
  else
    @final_output = @output[0]['AQI']
  end


  if @final_output == "Please Insert a Valid Postal Code"
    @api_color = "silver"
  elsif @final_output <= 50
    @api_description = "Your Ozone level is Good, perfect time todo some activities outside :)"
    @api_color = "bg-success"
  elsif @final_output >= 51 && @final_output <= 100
    @api_color = "bg-info"
    @api_description = "Your Ozone level is Ok but not recommended !!!"
  elsif @final_output >= 101 && @final_output <= 150
    @api_color = "bg-warning"
    @api_description = "Your Ozone level is Bad you should't do much outside"
  elsif @final_output >= 151 && @final_output <= 200
    @api_color = "bg-danger"
    @api_description = "Your Ozone level is Terrible do not go outside"
  elsif @final_output >= 201 && @final_output <= 300
    @api_color = "bg-dark"
    @api_description = "Where the fuck do ya live ?!"
  elsif @final_output >= 301 && @final_output <= 500
    @api_color = "bg-dark"
    @api_description = "Get the Hell Out"
  else 
    @api_color = "bg-secondary"

  end

  
  end

  def zipcode
    @input_zip = params[:zipcode]

      if params[:zipcode] == ""
      @input_zip = "You have to insert a ZipCode"
      elsif params[:zipcode]
        
    require 'net/http'
    require'json'

    @url ='http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @input_zip + '&distance=0&API_KEY=FDC69977-1840-4DDC-BC12-C5138B6C32BD'
    @uri = URI(@url)
    @responde = Net::HTTP.get(@uri)
    @output = JSON.parse(@responde)
    @area_location = @output[1]['ReportingArea']

      #Check empty result
  if @output.empty?
    @final_output = "Please Insert a Valid Postal Code"
  elsif !@output
    @final_output = "You haven't insert a Postal Code"
  else
    @final_output = @output[0]['AQI']
  end
  


  if @final_output == "Please Insert a Valid Postal Code"
    @api_color = "silver"
  elsif @final_output <= 50
    @api_description = "Your Ozone level is Good, perfect time todo some activities outside :)"
    @api_color = "bg-success"
  elsif @final_output >= 51 && @final_output <= 100
    @api_color = "bg-info"
    @api_description = "Your Ozone level is Ok but not recommended !!!"
  elsif @final_output >= 101 && @final_output <= 150
    @api_color = "bg-warning"
    @api_description = "Your Ozone level is Bad you should't do much outside"
  elsif @final_output >= 151 && @final_output <= 200
    @api_color = "bg-danger"
    @api_description = "Your Ozone level is Terrible do not go outside"
  elsif @final_output >= 201 && @final_output <= 300
    @api_color = "bg-dark"
    @api_description = "Where the fuck do ya live ?!"
  elsif @final_output >= 301 && @final_output <= 500
    @api_color = "bg-dark"
    @api_description = "Get the Hell Out"
  else 
    @api_color = "bg-secondary"

  end











      end

  end

end
