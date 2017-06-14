class StaticPagesController < ApplicationController



  def home
      #@home = home
      
      
  end
  
  
  def parse_address
    @street = params[:Street]
    redirect_to fake_url(@street) 
  end
  
  def fake
      
  end
  
  
end