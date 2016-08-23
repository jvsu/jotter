class YourTag < ActiveRecord::Base
  belongs_to :user


 def self.tags(user_id)
 	 #get all tag entries
    tags = Tag.all

    #put all tag_names into an array
    tags_array = []

    tags.each do |t|
      tags_array.push(t.tag_name)
    end

    #remove duplicates in an array
    tags_array = tags_array.uniq

    #Get my_tags... tags that belong to you

    mtags = YourTag.all.where(user_id:user_id)
    
    #put it into an array and remove duplicates
    my_tags_array = []
    
    mtags.each do |mt|
      my_tags_array.push(mt.tag)
    end

    my_tags_array = my_tags_array.uniq

    #go through my_tags array and use array.delete 

    my_tags_array.each do |mt|
        tags_array.delete(mt)
    end

    return tag_data = {tags:tags_array, my_tags:my_tags_array}

 end

end
