class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all.order("created_at DESC")
    end
  end
  # def self.search(search)
  #   return Tweet.all unless search
  #   Tweet.where('text LIKE(?)', "%#{search}%")
  # end
end
