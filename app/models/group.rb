class Group < ActiveRecord::Base
  belongs_to :note
  has_many :group_notes
  validates :name, :user_id, presence:true
  validates :user_id, numericality:true
end
