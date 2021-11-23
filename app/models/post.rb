class Post < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
  
    # Active Storage
    has_one_attached :image, :dependent => :destroy  
    
    # Associations
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :collects, class_name: "Collect", dependent: :destroy
    belongs_to :user
  
    # Validations
    validates :user_id, presence: true
    validates :caption, presence: true
    
    # Methods
   
  end
  