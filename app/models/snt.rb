class Snt < ApplicationRecord
  belongs_to :user
  has_many :SntNews
end
