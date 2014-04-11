class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|
      t.string :description
      t.boolean :completed, default: false
      t.references :task, index: true

      t.timestamps
    end
  end
end
