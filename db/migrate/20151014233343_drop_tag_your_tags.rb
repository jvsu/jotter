class DropTagYourTags < ActiveRecord::Migration
  def change
  	drop_table :your_tags
  end
end
