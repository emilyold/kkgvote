class WelcomeController < ApplicationController
  def index
  	if user_signed_in? 
  		if Static.exists?(:id => 1)
  			redirect_to static_path(1) # ah-ha! here is where we show them what we want to show them 
  		
  		else 
  			Static.create(:id => 1, :current => 1)
  			redirect_to static_path(1)
  		end	
  	end 
  end 
end
