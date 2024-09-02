class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_fromメソッドとは、サーバーとクライアントを関連づけるメソッド
    stream_from 'comment_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
