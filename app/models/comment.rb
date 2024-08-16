class Comment < ApplicationRecord
  #Commentモデルに、テキストに関するバリデーションを記述した
 validates :user, presence: true
 validates :content, presence: true
 validates :prototype, presence: true
  
  
belongs_to :user
belongs_to :prototype

end
