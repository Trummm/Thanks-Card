class ThankCard < ApplicationRecord
  belongs_to :user
  belongs_to :card_template
  has_many :likes
end
