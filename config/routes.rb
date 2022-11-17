Rails.application.routes.draw do
  # ルートパス ｢/｣ にアクセスした時､railsのデフォルト画面ではなく､
  # スケジュール一覧ページを表示するために､
  # ルート先をpostsコントローラーのindexアクションに指定する
  #get '/', to: 'posts#index'
  # rootメソッドを使って書き換え(この書き方はルートパス特有だけども､ポピュラ-) =>
  root :to => 'posts#index'
  
  resources :posts
end

