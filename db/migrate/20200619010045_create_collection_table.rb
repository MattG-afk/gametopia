class CreateCollectionTable < ActiveRecord::Migration[6.0]
  def change
    create_table :collection do |t|
      t.float :length
      t.integer :genre_id
      t.integer :console_id
      t.integer :user_id
    end
  end
end
