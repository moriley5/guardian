class MemoriesController < ApplicationController
  def new
    @guardian = GuardianProfile.find_by(id: params[:guardian_id])
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)

    if @memory.save
      redirect_to guardian_profile
    else
      @errors = @memory.errors_full_messages
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
