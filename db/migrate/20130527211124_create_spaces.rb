class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.references :user, index: true
      t.string :slug
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
