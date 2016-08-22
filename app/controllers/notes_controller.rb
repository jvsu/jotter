class NotesController < ApplicationController
  def new
    @collection = Collection.find(params[:collection_id])
    @user = User.find(session[:user_id])
    @existing_notes = Note.all.where(:collection_id=>@collection.id)
  end

  def create
    #Check if time stamp is a number and if so convert it to youtube time stamp
     time_info =  Note.time_stamp(note_params[:start_timeh],note_params[:start_time1],note_params[:start_time2])

    if time_info !=false
      #create new note
      note = Note.new(url:note_params[:url], user_id:note_params[:user_id],start_time:time_info[:time_stamp], time_stamp_h:time_info[:time_h], time_stamp_m:time_info[:time_m],time_stamp_s:time_info[:time_s], notes:note_params[:notes], collection_id:note_params[:collection_id])
        if note.save
          json_data = {success:'true',time:time_info[:time_stamp], note_id:note.id,start_timeh:note_params[:start_timeh] ,url:note_params[:url], user_id:note_params[:user_id],start_time1:note_params[:start_time1], start_time2:note_params[:start_time2], notes:note_params[:notes], collection_id:note_params[:collection_id]}
          render json:json_data
        else
           messages = note.errors.full_messages
            json_data = {success:'false', messages:messages}
           render json:json_data
        end
    else
       json_data = {success:'false', messages:"Time Entered Needs to be a Number"}
       render json:json_data
    end
  end 


  def retrieve
    note_id = params[:notes_id]
    @note = Note.find(note_id)
  end

  def update
    if note_update[:source] =='time'
        time_info = Note.time_stamp(note_update[:start_timeh],note_update[:start_time1],note_update[:start_time2])

        # if a number
        if time_info != false
          @note = Note.find(note_update[:note_id]).update(start_time:time_info[:time_stamp], time_stamp_h:time_info[:time_h], time_stamp_m:time_info[:time_m],time_stamp_s:time_info[:time_s])
          json_data = {message:'success',time_h:time_info[:time_h],time_m:time_info[:time_m], time_s:time_info[:time_s]}
          render json:json_data
        else
          json_data = {success:'false', messages:"Time Entered Needs to be a Number"}
          render json:json_data
        end
     
      #if not a number
    elsif note_update[:source]=='note'
        @note = Note.find(note_update[:note_id]).update(:notes=>note_update[:notes])
        note = note_update[:notes]
        json_data = {message:'success',notes:note}
        render json:json_data
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
