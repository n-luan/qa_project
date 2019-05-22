class User < ApplicationRecord
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true 
  has_secure_password
end
