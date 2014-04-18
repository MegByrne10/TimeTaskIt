class ChangeTaskTimeGoalToDateTime < ActiveRecord::Migration
  def change
    #change_column :table_name, :column_name, :new_type
    change_column :tasks, :time_goal, :datetime
  end
end
