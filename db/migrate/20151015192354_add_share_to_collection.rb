class AddShareToCollection < ActiveRecord::Migration
  def change
  	add_column :collections, :share, :boolean
  end
end
