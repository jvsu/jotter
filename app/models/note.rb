class Note < ActiveRecord::Base
    belongs_to :user
  belongs_to :collection
  has_many :group_notes
  has_many :point_supports
  validates :notes, :url, presence:true
  validates :user_id, :start_time,:time_stamp_h, :collection_id, :time_stamp_m, :time_stamp_s, presence:true, numericality:true
end
