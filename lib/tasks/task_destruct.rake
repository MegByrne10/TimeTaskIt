task task_delete: :environment do
  Task.where("time_goal <= ?", Time.now).each do |task|
    task.destroy
  end
end 