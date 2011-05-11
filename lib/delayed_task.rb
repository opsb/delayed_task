module DelayedTask
  class PerformableTask < Struct.new(:task)
    def perform
      system "rake #{task}"
    end
  end
end