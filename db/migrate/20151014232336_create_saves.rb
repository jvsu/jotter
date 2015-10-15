class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.references :user, index: true
      t.references :collection, index: true

      t.timestamps
    end
  end
end
