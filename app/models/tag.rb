class Tag < ApplicationRecord
  has_many :question_tags
  has_many :questions, through: :question_tags
  validates :content, length: {maximum: 16}, presence: true, uniqueness: true
end
