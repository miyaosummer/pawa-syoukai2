class Basic < ApplicationRecord
  validates :name, :number, presence: true
  validates :name, length: { maximum: 6 }
  validates :number, numericality: {less_than: 101}
  has_many :users
end
