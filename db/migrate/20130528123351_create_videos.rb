class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :type
      t.string :vid
      t.string :name
      t.string :author
      t.integer :aid, limit: 8
      t.text :description
      t.attachment :profile_image
      t.attachment :cover

      t.timestamps
    end
  end
end
