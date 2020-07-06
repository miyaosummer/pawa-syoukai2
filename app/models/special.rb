class Special < ApplicationRecord
  validates :name, presence: true , uniqueness: true
  has_many :users, through: :users_specials
end
