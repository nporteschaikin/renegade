class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commented, index: true, polymorphic: true, default: false
      t.references :user, index: true
      t.references :in_reply_to, index: true, default: false
      t.text :comment

      t.timestamps
    end
  end
end
