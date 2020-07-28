class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :summary
      t.text :description
      t.string :status, default: "Not started"
      t.references :user, null: true, foreign_key: true
      t.references :team, null: true, foreign_key: true

      t.timestamps
    end
  end
end
