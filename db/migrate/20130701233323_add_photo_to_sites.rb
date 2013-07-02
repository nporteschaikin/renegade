class AddPhotoToSites < ActiveRecord::Migration
  def change
    add_attachment :sites, :photo
  end
end
