class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :summary
      t.text :description
      t.string :status, default: "Not started"
      t.belongs_to :user
      t.belongs_to :team

      t.timestamps
    end
  end
end
