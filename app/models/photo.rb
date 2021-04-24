class Photo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :image
    validates :area
  end

    validates :area_id,numericality: { other_than: 1 }
end
