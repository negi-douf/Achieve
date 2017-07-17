class Blog < ActiveRecord::Base
    
    # 空の値を防ぐ
    # save の際に検証される
    validates :title, presence: true
    
    # user に属することを定義
    belongs_to :user
    
end
