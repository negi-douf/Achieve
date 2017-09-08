class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]


  def index
    @blogs = Blog.all
  end


  def new
    if params[:back]

      # 戻った際のパラメータ維持
      @blog = Blog.new(blogs_params)

    else
      # この変数は View でも使える
      @blog = Blog.new

    end
  end


  def create

    # ハッシュとして渡すことになるのかな
    # blogs_params == params[:blog] == {"title": ~, "content": ~}
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id

    # 保存成功時と失敗時で分岐
    if @blog.save
      # 作成が完了すると通知と共に一覧画面に飛ばす
      redirect_to blogs_path, notice: "ブログを作成しました！"
      # メールも送信
      NoticeMailer.sendmail_blog(@blog).deliver_now
    else
      # 入力フォームを再描画
      render "new"
    end

  end


  def edit
    # 取得するパラメータが一つの場合は SP はいらない
  end


  def update
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを編集しました！"
  end


  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end


  # 確認
  def confirm
    @blog = Blog.new(blogs_params)

    # 空の際は投稿画面に
    render :new if @blog.invalid?
  end


  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
  end



  private

  def blogs_params
    params.require(:blog).permit(:title, :content)
  end


  # id からブログを特定するメソッド
  def set_blog
    @blog = Blog.find(params[:id])
  end


  # 自分の投稿したブログしか編集・削除できないようにする
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to blogs_path, notice: "アクセスできませんでした。"
    end
  end

end
