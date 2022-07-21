class CreateHasCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :has_categories do |t|
      t.references :articles, null: false, foreign_key: true
      t.references :categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end
