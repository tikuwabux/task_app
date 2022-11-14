class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      # null: false, defoult: false はrails g model 実行後､手打ちで付け加えた
      t.boolean :all_day, null: false, default: false
      t.text :memo

      t.timestamps
    end
  end
end
