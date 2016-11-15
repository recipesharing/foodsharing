class HardWorker
  include Sidekiq::Worker
  sidekiq_options try: 5
  def perform(name)
    puts name * 3
  end
end
