class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :books, dependent: :destroy

  has_one_attached :profile_image
  # “profile_image”という名前で画像を保存できるようになる

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('/bookers2/app/assets/images/no-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100,100]).processed
  end

end
