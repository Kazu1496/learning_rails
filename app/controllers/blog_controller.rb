class BlogController < ApplicationController
  protect_from_forgery :except => [:create]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params['id'])
    @entries = Entry.where(blog_id: params['id'])
  end

  def create
    blog = Blog.new(create_blog_params)
    respond_to do |format|
      if blog.save
        format.html { redirect_to root_path, notice: 'ブログを作成しました。' }
      else
        format.html { redirect_to new_blog_path, notice: 'ブログを作成できませんでした。値を正しく入力してください。' }
      end
    end
  end

  def destroy
    Blog.delete(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'ブログを削除しました。' }
    end
  end

  private
    def create_blog_params
      params.require(:blog).permit(:title)
    end
end
