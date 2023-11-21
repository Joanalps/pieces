class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :piece

  validates :start_date, date: { after_or_equal_to: Proc.new { Date.today }, message: 'must be today or after' }, on: :create
  validates :end_date, date: { after_or_equal_to: :start_date }
end
