class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :notification, dependent: :destroy
  
  def pusher_trigger(current_user)

  end
end
