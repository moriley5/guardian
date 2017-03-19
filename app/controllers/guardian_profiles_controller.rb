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
    @memories = @guardian.memories
  end

  def edit
  end

  def update
  end

  private

  def guardian_params
    params.require(:guardian_profile).permit(:user_id, :title, :image)
  end

end
