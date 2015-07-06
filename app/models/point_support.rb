class PointSupport < ActiveRecord::Base
  belongs_to :note
  belongs_to :point
  belongs_to :user
    validates :user_id, :note_id, :point_id, presence:true, numericality:true

end
