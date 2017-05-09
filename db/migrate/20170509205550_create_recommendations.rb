class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.integer :user_id, :null => false
  	  t.integer :recommended_id, :null => false
  	  t.integer :recommender_id, :null => false
  	  
      t.timestamps
    end
  end
end
