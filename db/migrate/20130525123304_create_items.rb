class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :object, index: true, polymorphic: true
      t.references :user, index: true
      t.references :room, index: true
      t.text :message

      t.timestamps
    end
  end
end
