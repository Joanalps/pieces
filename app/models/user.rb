class User < ApplicationRecord
  has_many :pieces, dependent: :destroy
  has_many :transactions
  has_many :transactions, through: :pieces
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :top_size, presence: true
  # validates :top_size, numericality: { only_integer: true }
  # validates :top_size, numericality: { less_than_or_equal_to: 48, greather_than_or_equal_to: 34, even: true }
end
