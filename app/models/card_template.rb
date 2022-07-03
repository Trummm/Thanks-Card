class CardTemplate < ApplicationRecord
  has_many         :thank_cards
  has_one_attached :background

  validates :name, :top, :right, :bottom, :left, presence: true
  
  validates :background, content_type: { in: %w[image/jpeg image/gif image/png],
                                         message: "must be a valid image format" },
                                         size: { less_than: 5.megabytes,
                                         message: "should be less than 5MB" }

  scope :search_template, lambda {|search|
    search&.squish! if search
    ransack(name_cont: search).result
  } 
end
