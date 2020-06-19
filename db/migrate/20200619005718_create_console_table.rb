class CreateConsoleTable < ActiveRecord::Migration[6.0]
  def change
    create_table :console do |t|
      t.string :name
      t.string :description 
    end
  end
end
