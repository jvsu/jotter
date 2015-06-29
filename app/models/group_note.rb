class GroupNote < ActiveRecord::Base
  belongs_to :note
  belongs_to :group
  belongs_to :user
  validates :note_id, :group_id, :user_id, presence:true, numericality: true
end
