class CreateYourTags < ActiveRecord::Migration
  def change
    create_table :your_tags do |t|
      t.string :tag
      t.references :user, index: true

      t.timestamps
    end
  end
end
