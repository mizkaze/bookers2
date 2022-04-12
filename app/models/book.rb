class Book < ApplicationRecord

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  # アソシエーション
  belongs_to :user

end
