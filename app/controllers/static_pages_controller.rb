class StaticPagesController < ApplicationController



  def home
      #@home = home
      
      
  end
  
  
  def parse_address
    @street = params[:Street]
    response = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV["MAPS_API_KEY"]}&address=#{@street}")
    @json = JSON.parse(response.body)
   
#Determines Congressional District 
    @division_hash = @json.fetch("divisions")
    @ocd_division = @division_hash.keys[2] 
    @district_hash = @division_hash.fetch(@ocd_division)
#    @district_name = @district_hash.fetch("name").titleize

#Creates Hash Of All Office Holders In District    
    @office_holders_hash = @json.fetch("officials")
    
# US Senator One
    @senator_one_hash = @office_holders_hash[2]
 #   @senator_one_name = @senator_one_hash.fetch("name")
 #   @senator_one_party = @senator_one_hash.fetch("party")
 #   @senator_one_photo_url = @senator_one_hash.fetch("photoUrl")
    @senator_one_websites_array = @senator_one_hash.fetch("urls")
 #   @senator_one_website = @senator_one_websites_array[0]

    #US Senator One Social Media
    @senator_one_socials_array = @senator_one_hash.fetch("channels")
    @senator_one_socials_array.each do |hash|
      if hash.has_value?("Facebook") 
        @senator_one_facebook = hash.fetch("id")
      elsif hash.has_value?("Twitter")
        @senator_one_twitter = hash.fetch("id")
      end
        
     end


# US Senator Two
    @senator_two_hash = @office_holders_hash[3]
#    @senator_two_name = @senator_two_hash.fetch("name")
#    @senator_two_party = @senator_two_hash.fetch("party")
#    @senator_two_photo_url = @senator_two_hash.fetch("photoUrl")
    @senator_two_websites_array = @senator_two_hash.fetch("urls")
#    @senator_two_website = @senator_two_websites_array[0]

    #US Senator Two Social Media
    @senator_two_socials_array = @senator_two_hash.fetch("channels")
    @senator_two_socials_array.each do |hash|
      if hash.has_value?("Facebook") 
        @senator_two_facebook = hash.fetch("id")
      elsif hash.has_value?("Twitter")
        @senator_two_twitter = hash.fetch("id")
      end
        
     end

# US Rep 
    @us_rep_hash = @office_holders_hash[4]
#    @us_rep_name = @us_rep_hash.fetch("name")
#    @us_rep_party = @us_rep_hash.fetch("party")
#    @us_rep_photo_url = @us_rep_hash.fetch("photoUrl")
    @us_rep_websites_array = @us_rep_hash.fetch("urls")
#    @us_rep_website = @us_rep_websites_array[0]

    #US Rep Social Media
    @us_rep_socials_array = @us_rep_hash.fetch("channels")
    @us_rep_socials_array.each do |hash|
      if hash.has_value?("Facebook") 
        @us_rep_facebook = hash.fetch("id")
      elsif hash.has_value?("Twitter")
        @us_rep_twitter = hash.fetch("id")
      end
        
     end
  
      @district = District.new
 
      @district.district_name = @district_hash.fetch("name").titleize
      
      @district.senator_one_name = @senator_one_hash.fetch("name")
      @district.senator_one_party = @senator_one_hash.fetch("party")
      @district.senator_one_photo_url = @senator_one_hash.fetch("photoUrl")
      @district.senator_one_website = @senator_one_websites_array[0]
      @district.senator_one_facebook = @senator_one_facebook
      @district.senator_one_twitter = @senator_one_twitter

      @district.senator_two_name = @senator_two_hash.fetch("name")
      @district.senator_two_party = @senator_two_hash.fetch("party")
      @district.senator_two_photo_url = @senator_two_hash.fetch("photoUrl")
      @district.senator_two_website = @senator_two_websites_array[0]
      @district.senator_two_facebook = @senator_two_facebook
      @district.senator_two_twitter = @senator_two_twitter

      @district.us_rep_name = @us_rep_hash.fetch("name")
      @district.us_rep_party = @us_rep_hash.fetch("party")
      @district.us_rep_photo_url = @us_rep_hash.fetch("photoUrl")
      @district.us_rep_website = @us_rep_websites_array[0]
      @district.us_rep_facebook = @us_rep_facebook
      @district.us_rep_twitter = @us_rep_twitter


      @district.save
 #     @district

      redirect_to district_path(@district)
  
  end
  
  
  
  
  
  def fake
     response = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV["MAPS_API_KEY"]}&address=333%20El%20Camino%20Real,%20San%20Bruno,%20CA,%20United%20States")
    @json = JSON.parse(response.body)
   
#Determines Congressional District 
    @division_hash = @json.fetch("divisions")
    @ocd_division = @division_hash.keys[2] 
    @district_hash = @division_hash.fetch(@ocd_division)
    @district = @district_hash.fetch("name").titleize

#Creates Hash Of All Office Holders In District    
    @office_holders_hash = @json.fetch("officials")
    
# US Senator One
    @senator_one_hash = @office_holders_hash[2]
    @senator_one_name = @senator_one_hash.fetch("name")
    @senator_one_party = @senator_one_hash.fetch("party")
    @senator_one_photo_url = @senator_one_hash.fetch("photoUrl")
    @senator_one_websites_array = @senator_one_hash.fetch("urls")
    @senator_one_website = @senator_one_websites_array[0]

    #US Senator One Social Media
    @senator_one_socials_array = @senator_one_hash.fetch("channels")
    @senator_one_socials_array.each do |hash|
      if hash.has_value?("Facebook") 
        @senator_one_facebook = hash.fetch("id")
      elsif hash.has_value?("Twitter")
        @senator_one_twitter = hash.fetch("id")
      end
        
     end


# US Senator Two
    @senator_two_hash = @office_holders_hash[3]
    @senator_two_name = @senator_two_hash.fetch("name")
    @senator_two_party = @senator_two_hash.fetch("party")
    @senator_two_photo_url = @senator_two_hash.fetch("photoUrl")
    @senator_two_websites_array = @senator_two_hash.fetch("urls")
    @senator_two_website = @senator_two_websites_array[0]

    #US Senator Two Social Media
    @senator_two_socials_array = @senator_two_hash.fetch("channels")
    @senator_two_socials_array.each do |hash|
      if hash.has_value?("Facebook") 
        @senator_two_facebook = hash.fetch("id")
      elsif hash.has_value?("Twitter")
        @senator_two_twitter = hash.fetch("id")
      end
        
     end

# US Rep 
    @us_rep_hash = @office_holders_hash[4]
    @us_rep_name = @us_rep_hash.fetch("name")
    @us_rep_party = @us_rep_hash.fetch("party")
    @us_rep_photo_url = @us_rep_hash.fetch("photoUrl")
    @us_rep_websites_array = @us_rep_hash.fetch("urls")
    @us_rep_website = @us_rep_websites_array[0]

    #US Rep Social Media
    @us_rep_socials_array = @us_rep_hash.fetch("channels")
    @us_rep_socials_array.each do |hash|
      if hash.has_value?("Facebook") 
        @us_rep_facebook = hash.fetch("id")
      elsif hash.has_value?("Twitter")
        @us_rep_twitter = hash.fetch("id")
      end
        
     end


      
    
    
  
  end
  
  
end