class PostsController < ApplicationController
  before_action :set_rustle, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(rustle_param)
    if params[:back]
       render :new
    else
      if @post.save
        redirect_to posts_path, notice: "you rustle my heart!"
      else
        render :new
      end
    end
  end

  def confirm
    @post = Post.new(post_param)
    render :new if @post.invalid?
  end

  def edit
  end

  def show 
  end
 
  def update
    if @post.update(rustle_param)
      redirect_to posts_path, notice: "You have edited your rustle!"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "You have deleted your rustle!"
  end

  private
  
  def post_param
    params.require(:post).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end

end
