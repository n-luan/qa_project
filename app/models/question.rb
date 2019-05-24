class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :comments, as: :commentable
  has_many :answers
end
