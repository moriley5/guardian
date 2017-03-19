class MemoriesController < ApplicationController
  def new
    @guardian = GuardianProfile.find_by(id: params[:guardian_profile_id])
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)
    @guardian = GuardianProfile.find_by(id: params[:guardian_profile_id])
    if @memory.save
      redirect_to guardian_profile_path(@guardian)
    else
      @errors = @memory.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def memory_params
    params.require(:memory).permit(:guardian_id, :description, :audio_recording, :audio, :date)
  end
end
