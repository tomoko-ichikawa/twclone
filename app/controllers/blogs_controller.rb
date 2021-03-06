class BlogsController < ApplicationController
    before_action :set_blog, only:[:show,:edit,:update, :destroy]
    
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
      @blog = Blog.new(blog_params)
      if @blog.save
          redirect_to new_blog_path, notice:"つぶやきを投稿しました"
      else
          render 'new'
      end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
      if @blog.update(blog_params)
          redirect_to blogs_path, notice: "つぶやきを編集しました"
      else
          render 'edit'
      end
  end
  
  def destroy
      @blog.destroy
      redirect_to blogs_path, notice: "つぶやきを削除しました"
  end
  
  def confirm
      @blog = Blog.new(blog_params)
      render :new if @blog.invalid?
  end
      
  private
  
  def blog_params
      params.require(:blog).permit(:content)
  end
  
  def set_blog
      @blog = Blog.find(params[:id])
  end
end
