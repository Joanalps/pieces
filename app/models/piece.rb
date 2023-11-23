class Piece < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_many_attached :photos

  BRAND = ['Dior', 'Chanel', 'Ralph Lauren', 'Celine', 'Isabel Marant', 'Lacoste', 'Sandro', 'Maje', 'Bash', 'Kooples']
  SIZE = [34, 36, 38, 40, 42, 44, 46, 48]
  CATEGORY = ['Coat', 'Jacket', 'Sweater', 'Dress', 'Blouse', 'Top', 'Jeans', 'Pants', 'Skirt']
  COLOR = ['Black', 'White', 'Beige', 'Grey', 'Blue', 'Red', 'Green', 'Yellow', 'Pink', 'Orange', 'Purple', 'Multicolor']
  TAG = ['Casual', 'Wedding', 'Cocktail', 'Business', 'Party', 'Everyday chic']
  DELIVERY_MODE = ['Pick up', 'Delivery']

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :price_per_day, :numericality => { :greater_than_or_equal_to => 0 }
  validates :brand, presence: true
  validates :brand, inclusion: { in: BRAND }
  validates :size, presence: true
  validates :size, inclusion: { in: SIZE }
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :color, presence: true
  validates :color, inclusion: { in: COLOR }
  validates :tag, presence: true
  validates :tag, inclusion: { in: TAG }
  validates :delivery_mode, presence: true
  validates :delivery_mode, inclusion: { in: DELIVERY_MODE }
  validates :photos, presence: true
end
