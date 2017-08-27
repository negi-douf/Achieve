class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :delete]

  def create
    # Blog をパラメータの値から探し出し、Blog に紐づく comments として build
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    # クライアント要求に応じてフォーマットを変更
    # 投稿の成功と失敗で分岐？
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    set_blog
  end

  def update
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを編集しました！"
  end

  def delete
  end


  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_blog
      @blog = @comment.blog
    end
end
