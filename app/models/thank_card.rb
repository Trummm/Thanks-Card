class ThankCard < ApplicationRecord
  include PublicActivity::Model
  tracked owner:     Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
  tracked recipient: Proc.new { |controller, model| model && model.user_take_thank_card }

  scope :search_user, lambda {|search|
    search&.squish! if search
    ransack(user_name_cont: search).result
  }      

  belongs_to :user
  belongs_to :user_take_thank_card, class_name: "User"
  belongs_to :card_template
  has_many   :likes, dependent: :destroy
  has_many   :comments, dependent: :destroy
end
