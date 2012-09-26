module DelayedTask
  class << self
    include Rake::DSL if defined?(Rake::DSL)
    def add_delayed_tasks
      Rake::Task.tasks.each do |task|
        task "delay:#{task.name}", *task.arg_names << :queue do |t, args|
          options = args.to_hash
          queue = options.delete(:queue)

          Rake::Task["environment"].invoke
          values = options.values.empty? ? "" : "[" + options.values.join(",") + "]"
          invocation = task.name + values

          if queue
            Delayed::Job.enqueue DelayedTask::PerformableTask.new(invocation), :queue => queue
          else
            Delayed::Job.enqueue DelayedTask::PerformableTask.new(invocation)
          end

          puts "Enqueued job: rake #{invocation}"
        end
      end
    end
  end
end

DelayedTask.add_delayed_tasks
