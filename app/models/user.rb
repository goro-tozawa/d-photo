class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :name,format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Name is invalid. Input full-width characters.' }

    validates :nickname

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password,with: PASSWORD_REGEX, message: "both letters and numbers"
  end

  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_photos, through: :likes, source: :photo

  def already_liked?(photo)
    self.likes.exists?(photo_id: photo.id)
  end
end