class CreateGroupNotes < ActiveRecord::Migration
  def change
    create_table :group_notes do |t|
      t.references :note, index: true
      t.references :group, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
