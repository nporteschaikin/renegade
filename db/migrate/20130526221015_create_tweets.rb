class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :tid, limit: 8
      t.text :tweet
      t.string :username
      t.string :name
      t.datetime :publish_date

      t.timestamps
    end
    add_attachment :tweets, :profile_image
  end
end
