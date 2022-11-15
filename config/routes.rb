Rails.application.routes.draw do
  # ルートパス ｢/｣ にアクセスした時､railsのデフォルト画面ではなく､
  # スケジュール一覧ページを表示するために､
  # ルート先をpostsコントローラーのindexアクションに指定する
  get '/', to: 'posts#index'
  
  resources :posts
end
