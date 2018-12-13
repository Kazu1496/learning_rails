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
    Entry.create(create_entry_params)
    redirect_to controller: :blog, action: :index
  end

  def destroy
    Entry.delete(params[:id])
    redirect_to '/'
  end

  private
  def create_entry_params
    params.require(:entry).permit(:title, :body).merge(blog_id: params[:blog_id])
  end
end
