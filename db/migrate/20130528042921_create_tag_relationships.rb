class CreateTagRelationships < ActiveRecord::Migration
  def change
    create_table :tag_relationships do |t|
      t.references :tag, index: true
      t.references :tagged, index: true, polymorphic: true

      t.timestamps
    end
  end
end
