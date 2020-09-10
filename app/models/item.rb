class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day


  validates :name , presence: true,
                    length: {maximum: 40}

  validates :explanation , presence: true,
                           length: {maximum: 1000}
  
  validates :category_id , presence: true,
                           numericality: { other_than: 1 } 

  validates :status_id , presence: true,
                         numericality: { other_than: 1 } 

  validates :shipping_charge_id , presence: true,
                                  numericality: { other_than: 1 } 

  validates :shipping_region_id , presence: true,
                               numericality: { other_than: 1 } 

  validates :shipping_day_id , presence: true,
                            numericality: { other_than: 1 } 

  validates :selling_price , presence: true,
                             format: { with: /\A[0-9]+\z/ },
                             numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
                            

  

  # #空の投稿を保存できないようにする
  # validates :title, :text, :genre, presence: true

  # #ジャンルの選択が「--」の時は保存できないようにする
  # validates :genre_id, numericality: { other_than: 1 } 
end
