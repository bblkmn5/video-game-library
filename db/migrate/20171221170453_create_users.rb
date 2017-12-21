class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |c|
      c.string :username
      c.string :email
      c.string :password_digest
    end
  end
end
