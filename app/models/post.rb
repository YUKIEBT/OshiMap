class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200 }
  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.search_for(keyword, method)
    case method
    when "exact"
      Post.where(title: keyword)
    when "prefix"
      Post.where('title LIKE ?', "#{keyword}%")
    when "suffix"
    when "partial"
      Post.where('title LIKE ?', "%#{keyword}%")
    end
  end
end
