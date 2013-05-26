class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag, index: true
      t.references :tagged, index: true, polymorphic: true

      t.timestamps
    end
  end
end
