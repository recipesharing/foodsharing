# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ThunderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "thunder_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def test(data)
    ActionCable.server.broadcast('thunder', action: 'append', data: "Test: #{data}")
    puts data
  end
end
