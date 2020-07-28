class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :summary
      t.string :assignee
      t.boolean :is_complete?, default: false
      t.references :user, null: true, foreign_key: true
      t.references :list, null: true, foreign_key: true

      t.timestamps
    end
  end
end
