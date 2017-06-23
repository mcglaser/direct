class StaticPagesController < ApplicationController



  def home
      #@home = home
      
      
  end
  
  
  def parse_address
    @street = params[:Street]
    response = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV["MAPS_API_KEY"]}&address=#{@street}")
    @json = JSON.parse(response.body)
    @district = []
    @test = @district.to_s
    
      @json.each do |hash|
        hash.each do |k, v|
        
      @district << v
        end
          
       end
     
    
    
    
    redirect_to fake_url(@street)
  end
  
  def fake
     response = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV["MAPS_API_KEY"]}&address=2224%20Mission%20Street,%20San%20Francisco,%20CA,%20United%20States")
    @json = JSON.parse(response.body)
   
  #  @test = @json.keys[2]
     @test = @json.fetch("divisions")
     @ocd_division = @test.keys[2] 
     @district_hash = @test.fetch(@ocd_division)
     @district = @district_hash.fetch("name").titleize
  
  end
  
  
end