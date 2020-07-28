class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.string :category
      t.references :user, null: true, foreign_key: true
      t.references :team, null: true, foreign_key: true

      t.timestamps
    end
  end
end
