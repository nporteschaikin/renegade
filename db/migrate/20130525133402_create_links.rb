class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :linked, index: true, polymorphic: true
      t.string :url

      t.timestamps
    end
  end
end
