class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  has_many :group_notes
  has_many :point_supports
  validates :notes, :url, presence:true
  validates :user_id, :start_time,:time_stamp_h, :collection_id, :time_stamp_m, :time_stamp_s, presence:true, numericality:true


  def self.valid_float(obj)
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  #generate time stamp
  def self.time_stamp(start_timeh,start_time1, start_time2) # the hour, minute and second parameters
	#check if time inputs are integers
	time1 = valid_float(start_timeh)
	time2 = valid_float(start_time1)
	time3 = valid_float(start_time2)

	if time1 ==true && time2==true && time3==true
	 #assign to arguments to parameters
		time_h = start_timeh
	    time1 = start_time1
	    time2 = start_time2
	 #need to convert time to seconds/integer
	      time_h_int = time_h.to_i
	      time1_int = time1.to_i 
	      time2_int = time2.to_i
	      time_stamp = (time_h_int *3600) + (time1_int *60)+ time2_int
	  	time_info ={time_stamp:time_stamp, time_h:time_h_int, time_m:time1_int,time_s:time2_int}
		 return time_info
	else
		return false
	end
end




end
