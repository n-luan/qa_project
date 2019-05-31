class User < ApplicationRecord

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest

  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 1}
  has_many :questions, dependent: :destroy
  has_many :votes, dependent: :destroy

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def active
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 1.hours.ago
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  has_one :profile
  delegate :full_name, to: :profile, prefix: true, allow_nil: true
  delegate :avatar, to: :profile, prefix: true, allow_nil: true
  delegate :address, to: :profile, prefix: true, allow_nil: true
end
