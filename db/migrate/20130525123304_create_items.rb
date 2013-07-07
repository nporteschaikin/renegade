class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :item, index: true, polymorphic: true
      t.references :user, index: true
      t.references :room, index: true
      t.boolean :published, default: true
      t.text :message

      t.timestamps
    end
  end
end
