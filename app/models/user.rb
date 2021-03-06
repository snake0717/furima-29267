class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true

  validates :email, uniqueness: true

  validates :password, length: { minimum: 6 },
                       format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  validates :family_name_kanji, presence: true,
                                format: { with: /\A[一-龥]+\z/ }

  validates :first_name_kanji, presence: true,
                               format: { with: /\A[一-龥]+\z/ }

  validates :family_name_katakana, presence: true,
                                   format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :first_name_katakana, presence: true,
                                  format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :birthday, presence: true
end
