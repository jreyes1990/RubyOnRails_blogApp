class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
