class ChangeIndexUniqueness < ActiveRecord::Migration
  def change
    remove_index :cats, :user_id
    remove_column :cats, :user_id
    add_column :cats, :user_id, :integer
  end
end
