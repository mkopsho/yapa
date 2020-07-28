class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :name
      t.references :list, null: true, foreign_key: true
      t.references :task, null: true, foreign_key: true

      t.timestamps
    end
  end
end
