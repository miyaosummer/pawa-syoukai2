class Special < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  has_many :users
end
