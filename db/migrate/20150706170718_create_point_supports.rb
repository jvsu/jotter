class CreatePointSupports < ActiveRecord::Migration
  def change
    create_table :point_supports do |t|
      t.references :note, index: true
      t.references :point, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
