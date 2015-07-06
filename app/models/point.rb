class Point < ActiveRecord::Base
  belongs_to :paper
  belongs_to :user
  has_many :pointsupports
  validates :paper_id, :user_id, presence:true, numericality:true
  validates :description, :explanation, presence:true
end
