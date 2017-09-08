class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  def pusher_trigger(current_user)
    unless self.blog.user.id == current_user.id
      Pusher.trigger('user_#{self.blog.user_id}_channel', 'comment_created', {
        message: 'あなたの作成したブログにコメントが投稿されました'
      })
    end
  end
end
