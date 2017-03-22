class NotesController < ApplicationController

  def new
    @note = Note.new
    @guardian = GuardianProfile.find_by(id: params[:guardian_profile_id])
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      redirect_to guardian_profile_path(params[:guardian_profile_id])
    else
      @errors = @note.errors.full_messages
      render 'new'
    end

  end

  def show
    @note = Note.find_by(id: params[:id])
    @guardian = GuardianProfile.find_by(id: params[:guardian_profile_id])
  end

  def edit
    @note = Note.find_by(id: params[:id])
    @guardian = GuardianProfile.find_by(id: params[:guardian_profile_id])

  end

  def update
    @note = Note.find_by(id: params[:id])
    if @note
      @note.update(notes_params)
      if @note.save
        redirect_to guardian_profile_path(params[:guardian_profile_id])
      else
        @errors = @note.errors.full_messages
        render 'edit'
      end
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def notes_params
    params.require(:note).permit(:guardian_id, :title, :body);
  end

end
