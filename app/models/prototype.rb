class Prototype < ApplicationRecord
  #バリデーションの設定
 validates :image, presence: true
 validates :title, presence: true
 validates :catch_copy, presence: true
 validates :user, presence: true
 validates :concept, presence: true
 



  belongs_to :user  
  has_many :comments ,dependent: :destroy 
  has_one_attached :image
end


