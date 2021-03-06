class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :logged_in?, only:[:new,:create]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿を作成しました！"
        BlogMailer.blog_mail(@blog).deliver
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"投稿を削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def correct_user
    if current_user.id != @blog.user_id
      flash[:notice] = "権限がないです"
      redirect_to blogs_path
    end
  end
end