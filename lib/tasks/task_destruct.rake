task task_delete: :environment do
  Task.where("time_goal <= ?", Time.now).destroy_all
  puts "Tasks Culled"
end