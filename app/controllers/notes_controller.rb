class NotesController < ApplicationController
  def new
    @collection = Collection.find(params[:collection_id])
    @user = User.find(session[:user_id])
    @existing_notes = Note.all.where(:collection_id=>@collection.id)
  end

  def create
    time_h = note_params[:start_timeh]
    time1 = note_params[:start_time1]
    time2 = note_params[:start_time2]
    # if time_h.is_a?(Integer) && time1.is_a?(Integer)  && time2.is_a?(Integer) # need to write a way to handle non number inputs

      #need to convert time to seconds/integer
      time_h_int = time_h.to_i
      time1_int = time1.to_i 
      time2_int = time2.to_i
      time_stamp = (time_h_int *3600) + (time1_int *60)+ time2_int

      note = Note.new(url:note_params[:url], user_id:note_params[:user_id],start_time:time_stamp, time_stamp_h:time_h_int, time_stamp_m:time1_int,time_stamp_s:time2_int, notes:note_params[:notes], collection_id:note_params[:collection_id])
      if note.save
        json_data = {success:'true',time:time_stamp, note_id:note.id,start_timeh:note_params[:start_timeh] ,url:note_params[:url], user_id:note_params[:user_id],start_time1:note_params[:start_time1], start_time2:note_params[:start_time2], notes:note_params[:notes], collection_id:note_params[:collection_id]}
        render json:json_data

      else
         messages = note.errors.full_messages
          json_data = {success:'false', messages:messages}
         render json:json_data
      end
    # else
    #    json_data = {success:'false', messages:"Time Entered Needs to be a Number"}
    #    render json:json_data
    # end
  end 

  def retrieve
    note_id = params[:notes_id]
    @note = Note.find(note_id)
  end

  def update
    if note_update[:source] =='time'
      time_h = note_update[:start_timeh]
      time1 = note_update[:start_time1]
      time2 = note_update[:start_time2]
      time_h_int = time_h.to_i
      time1_int = time1.to_i 
      time2_int = time2.to_i
      time_stamp = (time_h_int *3600) + (time1_int *60)+ time2_int
      @note = Note.find(note_update[:note_id]).update(start_time:time_stamp, time_stamp_h:time_h_int, time_stamp_m:time1_int,time_stamp_s:time2_int)
       json_data = {message:'success',time_h:time_h_int,time_m:time1_int, time_s:time2_int}
      render json:json_data

    elsif note_update[:source]=='note'
        @note = Note.find(note_update[:note_id]).update(:notes=>note_update[:notes])
        note = note_update[:notes]
        json_data = {message:'success',notes:note}
        render json:json_data
    else

    end
  
  end

  def destroy
    collection_id = params[:collection_id]
    @delete_note = Note.find(params[:note_id]).delete
    redirect_to "/notes/new/#{collection_id}"
  end

  private
    def note_params
        params.require(:note).permit( :url, :user_id, :start_time1,:start_time2, :notes, :collection_id, :start_timeh )
    end
    def note_update
        params.require(:note).permit(:notes, :note_id, :start_time1, :start_time2, :start_timeh, :source)
    end
end
