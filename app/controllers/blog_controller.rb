class BlogController < ApplicationController
  protect_from_forgery :except => [:create]

  def index
    @blogs = Blog.all
  end

  def new;end

  def show
    @blog = Blog.find_by(id: params['id'])
    @entrys = Entry.where(blog_id: params['id'])
  end

  def create
    Blog.create(title: params['title'])
    redirect_to '/'
  end

  def destroy
    Blog.delete(params[:id])
    redirect_to root_path
  end
end
