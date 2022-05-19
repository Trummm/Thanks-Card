class ThankCard < ApplicationRecord
  belongs_to :user
  belongs_to :card_template
end
