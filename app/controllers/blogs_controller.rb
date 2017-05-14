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
    
    # 作成が完了すると通知と共に一覧画面に飛ばす
    redirect_to blogs_path, notice: "ブログを作成しました！"
  end
  
  
  def edit
    # id を使って対象を特定
    # 取得するパラメータが一つの場合は SP いらない
    @blog = Blog.find(params[:id])
  end
  
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blogs_params)
    
    redirect_to blogs_path, notice: "ブログを編集しました！"
  end
  
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end
  
  
  
  ########
  private
  ########
  
  def blogs_params
    params.require(:blog).permit(:title, :content)
  end
  
end
