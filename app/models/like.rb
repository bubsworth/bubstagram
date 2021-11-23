class Like < ApplicationRecord
    # Associations
    belongs_to :post
    belongs_to :user
    after_commit :send_new_like_notification, on: :create
  
    # Validations
    validates :user_id, presence: :true
    
    # Methods
    def send_new_like_notification
      NewLike.with(like: self).deliver(self.post.user)
    end
  
  end
  