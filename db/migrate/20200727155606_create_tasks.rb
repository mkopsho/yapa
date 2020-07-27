class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :label
      t.boolean :is_complete?
      t.references :user, null: true, foreign_key: true
      t.references :list, null: true, foreign_key: true

      t.timestamps
    end
  end
end
