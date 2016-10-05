class Tag < ActiveRecord::Base
  belongs_to :collection
  


  def self.collection_tag(user_id)
  	# # get your tags
		your_tags = YourTag.all.where(user_id:user_id)
		
		# put your tag names in an array
		ytag =[]
		your_tags.each do |yt|
			ytag.push(yt.tag)
		end
		# #get all tags
		tags = Tag.all

		#put records that match your_tags into an array
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
    
    #goes through the array and add the tag names with hash tags
    array.each do |a|
      if a[0]=='#' && a.length >1
        a.slice!(0)
        a.downcase!
        tag = Tag.new(tag_name:a,collection_id:collection_id).save
      end
    end

    #publish by setting the share field to true on the collection table
    collection = Collection.find(collection_id).update(share:true)


end

end
