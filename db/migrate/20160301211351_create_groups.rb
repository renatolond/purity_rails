class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :headline
      t.text :description
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
