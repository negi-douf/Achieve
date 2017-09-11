class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :notifications, dependent: :destroy

  def pusher_trigger(current_user)
    unless self.blog.user_id == current_user.id
      Pusher.trigger("user_#{self.blog.user_id}_channel", 'comment_created', {
        message: 'あなたの作成したブログにコメントが付きました'
      })
      Pusher.trigger("user_#{self.blog.user_id}_channel", 'notification_created', {
        unread_counts: Notification.where(user_id: self.blog.user.id, read: false).count
      })
    end
  end
end
