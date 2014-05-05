class ChangeDateFormatInTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :time_goal, :date
  end
end
