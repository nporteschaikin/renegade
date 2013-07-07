class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :user, index: true
      t.string :slug
      t.string :name
      t.text :description
      t.boolean :moderated, default: false

      t.timestamps
    end
  end
end
