class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :relationships, foreign_key: :follower_id, class_name:"Relationship", dependent: :destroy
  # has_many :followings, through: :relationships, source: :followed
  # has_many :reverse_of_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  # has_many :followers, through: :reverse_of_relationships, source: :follower

  # has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  # has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy

  has_one_attached :image

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def get_profile_image(width, height)
    if profile_image.attached?
    profile_image.variant(resize_to_limit: [width, height]).processed
    else
      'no_image.jpg'
    end
  end
  
end
