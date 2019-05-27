class Question < ApplicationRecord
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :category
  accepts_nested_attributes_for :tags, update_only: true, reject_if: :blank?
  validates :title, presence: true, length: {minimum: 8}
  validates :content, presence: true, length: {minimum: 12}
end
