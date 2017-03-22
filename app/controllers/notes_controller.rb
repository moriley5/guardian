class NotesController < ApplicationController

  def new
    @note = Note.new
    binding.pry
    @guardian = GuardianProfile.find_by(id: params[:guardian_profile_id])
  end

  def create
    @note = Note.new(notes_params)
    binding.pry
    if @note.save
      redirect_to guardian_profile_path(params[:guardian_profile_id])
    else
      @errors = @note.errors.full_messages
      render 'new'
    end

  end

  def edit

  end

  def update

  end

  private

  def notes_params
    params.require(:note).permit(:guardian_id, :title, :body);
  end

end
