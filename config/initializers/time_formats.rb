#､時間系の新しいフォーマットを作成

# フォーマットを読み込むインスタンスのクラス名: :DATE_FORMATS[:お好みのキー名] = '新しいフォーマット'
# で作成可能

# このフォーマットを読み込むインスタンス post.start_date ､ post.end_date のクラス名は Date
# Date::DATE_FORMATS ハッシュに､日本の日付(date)のフォーマットを追加
# start_date や end_date を表示する時に使う 
Date::DATE_FORMATS[:date_jp] = '%Y年 %m月%d日'

# このフォーマットを読み込むインスタンス post.updated_at のクラス名は ActiveSupport::TimeWithZone
# Time::DATE_FORMATS ハッシュに､日本の日時(datetime)のフォーマットを追加
# updated_at を表示するときに使う
Time::DATE_FORMATS[:datetime_jp] = '%Y年 %m月%d日 %H時%M分'