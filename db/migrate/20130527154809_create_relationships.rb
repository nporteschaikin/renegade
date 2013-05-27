class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user, index: true
      t.references :followed, index: true, polymorphic: true

      t.timestamps
    end
  end
end
