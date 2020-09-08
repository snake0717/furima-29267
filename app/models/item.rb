class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day

  

  # #空の投稿を保存できないようにする
  # validates :title, :text, :genre, presence: true

  # #ジャンルの選択が「--」の時は保存できないようにする
  # validates :genre_id, numericality: { other_than: 1 } 
end
