class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    # Blog をパラメータの値から探し出し、Blog に紐づく comments として build
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    #@notification = @comment.notifications.build(user_id: @blog.user.id )
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました！' }
        format.js { render :index }
        # pusher
        @comment.pusher_trigger(current_user)
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @blog = @comment.blog
  end

  def update
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを編集しました！"
  end

  def destroy
    respond_to do |format|
      if @comment.delete
        format.html { redirect_to blog_path(@blog), notice: "コメントを削除しました！" }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end


  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
