class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true
      t.integer :start_time
      t.string :notes
      t.string :url
      t.references :collection, index: true
      t.integer :time_stamp_h
      t.integer :time_stamp_m
      t.integer :time_stamp_s

      t.timestamps
    end
  end
end
