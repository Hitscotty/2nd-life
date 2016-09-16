require 'httparty'

class FoodnetController < ApplicationController

  def net
   fooddata = HTTParty.get('http://demo.ckan.org/api/1/rest/dataset')
   #render text: fooddata
   @data = fooddata[10]
   @dataset = fooddata
  end

end
