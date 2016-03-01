class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
