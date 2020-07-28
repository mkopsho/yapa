class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :summary
      t.string :assignee
      t.boolean :is_complete?, default: false
      t.belongs_to :user
      t.belongs_to :list

      t.timestamps
    end
  end
end
