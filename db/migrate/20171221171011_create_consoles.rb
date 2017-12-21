class CreateConsoles < ActiveRecord::Migration[5.1]
  def change
    create_table :consoles do |c|
      c.string :name
      c.string :company
      c.integer :user_id
    end
  end
end
