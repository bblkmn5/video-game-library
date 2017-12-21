class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |c|
      c.string :name
      c.string :esrb_rating
      c.integer :console_id
    end
  end
end
