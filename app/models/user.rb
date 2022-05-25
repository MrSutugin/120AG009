class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true,
                   format: {
                     with: /\A(?=.{3,28}\z)[a-zA-Z0-9]+(?:[._][a-zA-Z0-9]+)*\z/,
                     message: 'при создании логина можно использовать латинские буквы, цифры, подчеркивания (_) и точки (.)'
                   },
                   uniqueness: true
  extend FriendlyId
  friendly_id :name, use: :slugged
  before_create { self.user_uid = SecureRandom.hex(8) }
  has_many :snts
  has_many :snt_news
end
