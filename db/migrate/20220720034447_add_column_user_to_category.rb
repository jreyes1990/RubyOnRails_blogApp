class AddColumnUserToCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :user, null: true, foreign_key: true
  end
end
