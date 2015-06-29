class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
