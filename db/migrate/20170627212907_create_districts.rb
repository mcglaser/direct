class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :district_name
      
      t.string :senator_one_name
      t.string :senator_one_party
      t.string :senator_one_photo_url
      t.string :senator_one_website
      t.string :senator_one_facebook
      t.string :senator_one_twitter
      
      t.string :senator_two_name
      t.string :senator_two_party
      t.string :senator_two_photo_url
      t.string :senator_two_website
      t.string :senator_two_facebook
      t.string :senator_two_twitter
           
      t.string :us_rep_name
      t.string :us_rep_party
      t.string :us_rep_photo_url
      t.string :us_rep_website
      t.string :us_rep_facebook
      t.string :us_rep_twitter
           
      
      
      t.timestamps null: false
      
    end
  end
end
