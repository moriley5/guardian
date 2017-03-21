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
    @memory = Memory.find_by(id: params[:id])
  end

  def update
    @memory = Memory.find_by(id: params[:id])
    if @memory
      @memory.update(memory_params)
      if @memory.save
        redirect_to guardian_profile_path
      else
        @errors = @memory.errors.full_messages
        render 'edit'
      end
    else
      redirect_to user_path(current_user)
    end
  end

  private
  def memory_params
    params.require(:memory).permit(:guardian_id, :description, :audio, :date)
  end
end
