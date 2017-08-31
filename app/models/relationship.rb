class Relationship < ActiveRecord::Base
  # follower という名前の参照関係を定義
  # User に属する
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
