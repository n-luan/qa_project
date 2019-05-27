class Question < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :question_tags
  has_many :tags, through: :question_tags
  accepts_nested_attributes_for :tags, update_only: true, reject_if: :blank?
  has_many :comments, as: :commentable
  has_many :answers
  validates :title, presence: true, length: {minimum: 8}
  validates :content, presence: true, length: {minimum: 12}
end
