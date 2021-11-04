class Post < ApplicationRecord
  # Active Storage
  has_one_attached :image, :dependent => :destroy

  # Associations
  has_one :user

  # Validations

  # Methods
 
end
