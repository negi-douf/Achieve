class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  def pusher_trigger(current_user)
    
  end
end
