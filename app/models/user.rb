class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token
  attr_accessor :file
  attr_accessor :skip_validations_create, :skip_validations_update
  
  CSV_ATTRIBUTES = %w(name email phone address).freeze
  VALID_EMAIL_REGEX = /[a-z0-9]+@gmail.com/
  # VALID_PHONE_REGEX = /[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}/
  PASSWORD_MIN_LENGTH = 6

  before_save { self.email = email.downcase }

  scope :search_user, lambda {|search|
    search&.squish! if search
    ransack(name_cont: search).result
  }      
  
  
  has_secure_password
  has_one_attached :image
  has_one          :tag
  has_many         :thank_cards, dependent: :destroy
  has_many         :likes, dependent: :destroy
  has_many         :comments, dependent: :destroy

  validates :name, presence: true,
                   length: { maximum: 30 },
                   unless: :skip_validations_update

  validates :username, presence: true,
                       length: { maximum: 30 },
                       unless: :skip_validations_create

  validates :phone, presence: true,
                    unless: :skip_validations_create

  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    unless: :skip_validations_update

  validates :gender, inclusion: { in: %w[Male Female Other] },
                     unless: :skip_validations_create

  validates :password, presence: true,
                       length: { minimum: PASSWORD_MIN_LENGTH },
                       allow_nil: true

  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                                    size: { less_than: 5.megabytes,
                                    message: "should be less than 5MB" }
              
  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end

    def import_file file
      spreadsheet = Roo::Spreadsheet.open file
      header = spreadsheet.row 1
      (2..spreadsheet.last_row).each do |i|
        row = [header, spreadsheet.row(i)].transpose.to_h
        create! row
      end
    end 
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def remember 
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attri, token)
    digest = self.send(attri)
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
end
