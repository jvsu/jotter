class Paper < ActiveRecord::Base
  belongs_to :user
  has_many :points
  validates :name,:thesis, presence:true
  validates :user_id, presence:true, numericality:true
end
