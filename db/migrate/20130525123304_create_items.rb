class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.references :room, index: true
      t.references :item, index: true, polymorphic: true
      t.text :message

      t.timestamps
    end
  end
end
