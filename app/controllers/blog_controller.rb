class BlogController < ApplicationController
  protect_from_forgery :except => [:create]

  def index
    @blogs = Blog.all
  end

  def new;end

  def show
    @blog = Blog.find(params['id'])
    @entrys = Entry.where(blog_id: params['id'])
  end

  def create
    blog = Blog.new(title: params['title'])
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
end
