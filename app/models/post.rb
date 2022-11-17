class Post < ApplicationRecord
  validates :title, presence: true
  
  validates :start_date, presence: true
  # 開始日に､現在よりも前の日付を登録することを禁止
  validate :validate_start_date
  
  validates :end_date, presence: true
  # 終了日に開始日より前の日付を登録することを禁止
  validate :validate_end_date
  
  #  スケジュールメモは50文字以内に制限
  validates :memo, length: { maximum: 50 }
  
  private
  
  # 開始日に､現在より前の日付を登録することを禁止するprivateメソッド
  def validate_start_date
    if self.start_date < Date.current
      errors.add(:start_date, "に現在より前に日付は登録できません")
    end 
  end 
  
  # 終了日に開始日より前の日付を登録することを禁止するprivateメソッド
  def validate_end_date
     if self.end_date < self.start_date 
       errors.add(:end_date, 'に開始日より前の日付は登録できません｡')
     end
  end 
  
  # =>
  # 開始日もしくは終了日の片方だけ登録して､登録完了ボタンおすと､
  # NoMethodError
  # #undefined method `<' for nil:NilClass 
  # が発生するけど､それ以外はOKだからとりあえずこれでOK
  
end

