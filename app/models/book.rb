class Book < ApplicationRecord

  #タイトルと本文をバリデーション
  validates :title,:body, presence: true

end
