class HomesController < ApplicationController
  def index
  	# if person is logged in then get his credentials
  	if session[:user_id]
		@user = User.find(session[:user_id])
		@collections = Collection.all.where(:user_id=>@user.id)  


		# get your tags
			your_tags = YourTag.all.where(user_id:session[:user_id])
		
		# put your tag names in an array
		ytag =[]
			your_tags.each do |yt|
				ytag.push(yt.tag)
			end
		#get all tags
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
		saves = Save.all.where(user_id:@user.id)

		saves.each do |s|
			collection_tags.each do |c|
				if(s.collection_id==c)
					collection_tags.delete(s.collection_id)
				end
			end

		end
		# get the collections in the array
		@suggestions = Collection.find(collection_tags)
  	else
  		
  	end
  end
end
