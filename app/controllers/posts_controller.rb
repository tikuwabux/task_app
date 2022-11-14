class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end 
  
  def create
    
    # paramsで取得した値は､ハッシュの形かつ､
    # いろんなオブジェクトが混在しているので､
    
    # params()
    # =>
    # {
    #   :action => "create",
    #   :post => {
    #     :title => "入力値",
    #     :start_date => "",
    #     :end_date => "",
    #     :all_day => "true or false"
    #     :memo => "入力値"
    #   },
      
    #   :controller => "posts"
      
    # }
    
    # requireメソッドでオブジェクト名を指定したり､
    # permitメソッドで､そのオブジェクト中で､value値(テーブルで言うカラム値)を
    # 変更を許可するkey名(テーブルでいうカラム名)を指定して､
    # 取り出すデータを絞り込む｡また､それ以外のデータを弾く｡
    
    # 一言でいうと､Strong Parameters機能
    
    # params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo)
    # =>
    # {
    #   :post => {
    #     :title => "入力値",
    #     :start_date => "",
    #     :end_date => "",
    #     :all_day => "true or false"
    #     :memo => "入力値"
    #   }
    # }
    
    # 上のハッシュのようなデータをもつ､postインスタンス
    # (おそらく､DBへの保存成功後に､postレコードとなる｡
    # ハッシュのkey名は､レコードのカラム名に､
    # ハッシュのvalue値､はレコードのカラム値に対応するのでは?)
    # を作成し､インスタンス変数 @post に格納｡
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
    
    # ユーザーが指定どおりの入力をしていて､
    # postインスタンスがDBへ保存された､
    # つまり､postインスタンス→postレコードへの変換が成功した場合
    if @post.save
       
      # フラッシュメッセージを格納(ハッシュ flash の key :notice の valueとして )
      flash[:notice] = "ユーザーを新規登録しました"
      
      # スケジュール一覧ページに飛ばす
      redirect_to :posts
    else
      
      # 現コントローラー中のnewアクションに飛ばす
      # newアクションはnew.html.erb(スケジュール新規作成ページ)を呼び出す｡
      # つまり､｢不備があったから､もう一回入力し直してね｣ということ｡
      render "new"
    end
  end 
  
  def show
  end 
  
  def edit
  end 
  
  def update 
  end 
  
  def destroy
  end 
  
end