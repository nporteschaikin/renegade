class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.references :viewed, index: true, polymorphic: true
      t.string :ip
      t.float :latitude
      t.float :longitude
      t.datetime :created_at
    end

    add_column :items, :impressions_count, :integer, default: 0
    add_column :items, :uniques_count, :integer, default: 0

    add_column :rooms, :impressions_count, :integer, default: 0
    add_column :rooms, :uniques_count, :integer, default: 0

    add_column :spaces, :impressions_count, :integer, default: 0
    add_column :spaces, :uniques_count, :integer, default: 0

    add_column :tags, :impressions_count, :integer, default: 0
    add_column :tags, :uniques_count, :integer, default: 0

  end
end
