class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :name,format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Name is invalid. Input full-width characters.' }

    validates :nickname
  end
end