class CommentController < ApplicationController
  before_action :set_comment, only: [:destroy, :toggle_status]
  def create
    Comment.create(create_comment_params)
    redirect_to '/'
  end

  def destroy
    @comment.delete
    redirect_to '/'
  end

  def toggle_status
    @comment.toggle_status!
    redirect_to '/'
  end

  private
    def create_comment_params
      params.require(:comment).permit(:body, :status).merge(entry_id: params[:entry_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
