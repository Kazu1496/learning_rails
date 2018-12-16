class EntryController < ApplicationController
  protect_from_forgery :except => [:create]

  def new
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.new
  end

  def show
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entry.find(params[:id])
    @comment = Comment.new
  end

  def create
    entry = Entry.new(create_entry_params)
    respond_to do |format|
      if entry.save
        format.html { redirect_to blog_path(params[:blog_id]), notice: 'エントリーを作成しました。' }
      else
        format.html { redirect_to new_blog_entry_path(params[:blog_id]), notice: 'エントリーを作成できませんでした。値を正しく入力してください。' }
      end
    end
  end

  def destroy
    Entry.delete(params[:id])
    respond_to do |format|
      format.html { redirect_to blog_path(params[:blog_id]), notice: 'ブログを削除しました。' }
    end
  end

  private
    def create_entry_params
      params.require(:entry).permit(:title, :body).merge(blog_id: params[:blog_id])
    end
end
