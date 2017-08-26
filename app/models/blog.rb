class Blog < ActiveRecord::Base

    # 空の値を防ぐ
    # save の際に検証される
    validates :title, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy

end
