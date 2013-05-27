class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.references :space, index: true
      t.references :entity, index: true, polymorphic: true

      t.timestamps
    end
  end
end
