class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    puts Time.now.to_i
  end
end
