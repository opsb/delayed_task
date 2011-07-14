module DelayedTask
  class << self
    include Rake::DSL if defined?(Rake::DSL)
    def add_delayed_tasks
      Rake::Task.tasks.each do |task|
        task "delay:#{task.name}" do
          Rake::Task["environment"].invoke
          Delayed::Job.enqueue DelayedTask::PerformableTask.new(task.name)    
          puts "Enqueued job: rake #{task.name}"
        end
      end
    end
  end
end

DelayedTask.add_delayed_tasks
