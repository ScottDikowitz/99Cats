class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.string :session_token, null: false, unique: true
      t.timestamps
    end
    add_index :users, :session_token
  end
end
