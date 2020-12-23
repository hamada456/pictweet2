class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  #↑アソシエーションでbelongs_toを指定した場合
  #相手のモデルのid（今回はuser_id）が「空ではないか」というバリデーションが
  #デフォルトでかかるようになっている
  #validates :user_id presence: true ←不要

  has_many :comments  # commentsテーブルとのアソシエーション

  def self.search(search)#whereメソッドとLIKE句を使用して検索の処理
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
