class FoodnetController < ApplicationController
  def net
   @hotels = HTTParty.get('https://shielded-wave-66393.herokuapp.com',
   :headers =>{'Content-Type' => 'application/json'} )
  end


end
