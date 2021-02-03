class NotesController < ApplicationController

  # GET: /notes
  get "/notes" do
    redirect_if_not_logged_in
    @notes = Note.all
    erb :"/notes/index.html"
  end

  # GET: /notes/new
  get "/notes/new" do
    redirect_if_not_logged_in
    erb :"/notes/new.html"
  end

  # POST: /notes
  post "/notes" do
    redirect_if_not_logged_in
    redirect "/notes"
  end

  # GET: /notes/5
  get "/notes/:id" do
    redirect_if_not_logged_in
    erb :"/notes/show.html"
  end

  # GET: /notes/5/edit
  get "/notes/:id/edit" do
    redirect_if_not_logged_in
    @note = current_user.note.find_by_id(params[:id])
    if @note
      erb :"/notes/edit.html"
    else
      redirect "/notes/#{@note.id}"
    end
  end

  # PATCH: /notes/5
  patch "/notes/:id" do
    redirect_if_not_logged_in
    redirect "/notes/:id"
  end

  # DELETE: /notes/5/delete
  delete "/notes/:id/delete" do
    redirect_if_not_logged_in
    
    @note = current_user.notes.find_by_id(params[:id])
    if @note
      @note.destroy
      redirect "/notes"
    else
      redirect "/notes/ #{@note.id}"
    end
  end


  private
  def find_note
    @note = Note.find_by_id(params[:id])
  end
end


