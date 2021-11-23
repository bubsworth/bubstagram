class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Active Storage
  has_one_attached :image, dependent: :destroy

  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :collects, dependent: :destroy
  has_many :notifications, as: :recipient

  # Validations
  validates :email, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates :password, presence: true, if: -> {will_save_change_to_encrypted_password?}

  # Methods
  def collected_posts
    collects.map(&:post)
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
