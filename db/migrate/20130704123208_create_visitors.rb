class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.references :visited, index: true, polymorphic: true
      t.string :protocol
      t.float :latitude
      t.float :longitude
      t.datetime :created_at

      t.timestamps
    end

    add_column :items, :visitors_count, :integer, default: 0
    add_column :rooms, :visitors_count, :integer, default: 0
    add_column :spaces, :visitors_count, :integer, default: 0
    add_column :tags, :visitors_count, :integer, default: 0

  end
end