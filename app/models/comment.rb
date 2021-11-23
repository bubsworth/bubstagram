class Comment < ApplicationRecord
    default_scope -> { order(created_at: :asc) }
  
    # Associations
    belongs_to :user
    belongs_to :post
    after_commit :send_new_comment_notification, on: :create
    
    # Validations
    validates :user_id, presence: true
    validates :post_id, presence: true
    validates :comment, presence: true
  
    # Methods
    def send_new_comment_notification
      NewComment.with(comment: self).deliver(self.post.user)
    end
  end
  