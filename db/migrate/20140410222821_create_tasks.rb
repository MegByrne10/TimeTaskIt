class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.date :time_goal
      t.boolean :completed, default: false 
      t.references :list, index: true

      t.timestamps
    end
  end
end
