class User < ApplicationRecord
  has_one :profile
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: {case_sensitive: false}
  validates :password, presence: true
  has_secure_password
  delegate :full_name, to: :profile, prefix: true, allow_nil: true
  delegate :user_avatar, to: :profile, prefix: true, allow_nil: true
end
