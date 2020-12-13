class SocketChannel < ApplicationCable::Channel
  def subscribed
    stream_from "currentdate"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def currentdate
    ActionCable.server.broadcast "currentdate", {value: Time.now.strftime("%d/%m/%Y %I:%M:%S %p")}
  end
end
