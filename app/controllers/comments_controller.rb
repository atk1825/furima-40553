class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    return unless @comment.save

    # CommentChannelを通して、コメントと送信者の情報をbroadcast（送信）。commentというキー名で@commentを、userというキー名で、@comment.userを送信。
    CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user }
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
