class CreateCollectionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :game_name
      t.string :console
      t.string :genre
      t.integer :user_id
      
    end
  end
end
