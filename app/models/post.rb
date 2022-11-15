class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  #  スケジュールメモは50文字以内に制限
  validates :memo, length: { maximum: 50 }
end
