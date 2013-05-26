class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_attachment :sites, :favicon
  end
end
