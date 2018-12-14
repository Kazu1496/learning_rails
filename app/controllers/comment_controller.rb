class CommentController < ApplicationController
  before_action :set_params, only: [:destroy, :toggle_status]

  def create
    comment = Comment.new(create_comment_params)
    respond_to do |format|
      if comment.save
        format.html { redirect_to blog_entry_path(params[:blog_id], params[:entry_id]), notice: 'コメントを作成しました。' }
      else
        format.html { redirect_to blog_entry_path(params[:blog_id], params[:entry_id]), notice: 'コメントを作成できませんでした。値を正しく入力して下さい。' }
      end
    end
  end

  def destroy
    @comment.delete
    respond_to do |format|
      format.html { redirect_to blog_entry_path(@blog, @entry), notice: 'コメントを削除しました。' }
    end
  end

  def toggle_status
    @comment.toggle_status!
    respond_to do |format|
      format.html { redirect_to blog_entry_path(@blog, @entry), notice: 'ステータスを切り替えました。' }
    end
  end

  private
    def create_comment_params
      params.require(:comment).permit(:body, :status).merge(entry_id: params[:entry_id])
    end

    def set_params
      @blog = Blog.find(params[:blog_id])
      @entry = Entry.find(params[:entry_id])
      @comment = Comment.find(params[:id])
    end
end
