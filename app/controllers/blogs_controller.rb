class BlogsController < ApplicationController
  
  def index
    @blogs = Blog.all
  end
  
  
  def new
    # この変数は View でも使える
    @blog = Blog.new
  end
  
  
  def create
    # ハッシュとして渡すことになるのかな
    # blogs_params == params[:blog] == {"title": ~, "content": ~}
    Blog.create(blogs_params)
    
    # 作成が完了すると一覧画面に飛ばす
    redirect_to blogs_path
  end
  
  
  
  
  ########
  private
  ########
  
  def blogs_params
    params.require(:blog).permit(:title, :content)
  end
  
end
