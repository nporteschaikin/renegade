class CreateRoomsSpaces < ActiveRecord::Migration
  def change
    create_table :rooms_spaces, id: false do |t|
      t.references :space, index: true, null: false
      t.references :room, index: true, null: false
    end
    add_index :rooms_spaces, [:space_id, :room_id], unique: true
  end
end
