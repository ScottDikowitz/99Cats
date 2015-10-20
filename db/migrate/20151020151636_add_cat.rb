class AddCat < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.text :color, null: false
      t.text :name, null: false
      t.text :sex, limit: 1, null: false
      t.text :description
    end

    end
end
