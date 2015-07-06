class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :paper, index: true
      t.references :user, index: true
      t.string :description
      t.text :explanation

      t.timestamps
    end
  end
end
