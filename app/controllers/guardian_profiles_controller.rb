class GuardianProfilesController < ApplicationController

  def index
  end

  def new
    @guardian = GuardianProfile.new
  end

  def create
    @guardian = GuardianProfile.new(guardian_params)

    if @guardian.save
      redirect_to guardian_profile_path(@guardian)
    else
      @errors = @guardian.errors.full_messages
      render 'new'
    end
  end

  def show
    @guardian = GuardianProfile.find_by(id: params[:id])
    @memories = @guardian.memories.sort_by &:date
  end

  def edit
    @guardian = GuardianProfile.find_by(id: params[:id])
  end

  def update
    @guardian = GuardianProfile.find_by(id: params[:id])
    if @guardian
      @guardian.update(guardian_params)
      if @guardian.save
        redirect_to guardian_profile_path(@guardian)
      else
        @errors = @guardian.errors.full_messages
        render 'edit'
      end
    else
      redirect_to user_path(current_user)
    end
  end

  private
  def guardian_params
    params.require(:guardian_profile).permit(:user_id, :title, :image)
  end

end
