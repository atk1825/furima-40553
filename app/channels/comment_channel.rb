class CommentChannel < ApplicationCable::Channel
  def subscribed
    @item = Item.find(params[:item_id])
    # stream_forを使用し、@itemに関連したデータの経路を指定
    # モデルに関連する経路を作成する場合は、stream_foeeを使用
    stream_for @item
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
