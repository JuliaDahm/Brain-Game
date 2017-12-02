class Question < ApplicationRecord
  attr_accessible :text, :user_id, :answers_attributes
  belongs_to :user
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end
