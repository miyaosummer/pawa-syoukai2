class Basic < ApplicationRecord


  validates :name,:number, presence: true
  validates :number, numericality: {less_than: 101}
  has_many :users



end
