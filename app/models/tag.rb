class Tag < ActiveRecord::Base
  belongs_to :collection
  validates :collection_id, presence:true, numericality:true
  validates :tag_name, presence:true


#this method will return the collection_ids that match the tags you are intersested in. 

  def self.collection_tag(user_id) 


  	# # get tags you are subscribed to or interested in 
		your_tags = YourTag.all.where(user_id:user_id)
		
		# put your tag names in an array
		ytag =[]

		your_tags.each do |yt|
			ytag.push(yt.tag)
		end
		# #get all tags that are associated with collections 
		tags = Tag.all

		#put the collection_ids that match the tags you are interested in, into an array

		collection_tags=[] 

		ytag.each do |yt|
			tags.each do |t|
				if t.tag_name ==yt
				#put collection_ids into an array
					collection_tags.push(t.collection_id)
				end
			end
		end

		#remove duplicate collection ids
		collection_tags = collection_tags.uniq

		#get all saved collections
		saves = Save.all.where(user_id:user_id)

		saves.each do |s|
			collection_tags.each do |c|
				if(s.collection_id==c)
					collection_tags.delete(s.collection_id)
				end
			end
		end

	return collection_tags

  end

def self.share(string,collection_id)
	array = string.split(' ')
	tag_count = 0
    #goes through the array and add the tag names with hash tags
    array.each do |a|
      if a[0]=='#' && a.length >1
        a.slice!(0)
        a.downcase!
        tag = Tag.new(tag_name:a,collection_id:collection_id).save
        tag_count = tag_count +1
      end
    end

    if tag_count >0 
    	#publish by setting the share field to true on the collection table
    	collection = Collection.find(collection_id).update(share:true)
    else
    	return false 
    end



end

end
