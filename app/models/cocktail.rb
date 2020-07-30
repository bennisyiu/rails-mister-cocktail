class Cocktail < ApplicationRecord
  # has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, :through => :doses

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: {in: ['Vodka', 'Gin', 'Rum', 'Bourbon', 'Scotch', 'Whiskey', 'Tequila', 'Brandy', 'Other']}
end
