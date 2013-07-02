class CreateOpenGraphTags < ActiveRecord::Migration
  def change
    create_table :open_graph_tags do |t|
      t.references :site, index: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
