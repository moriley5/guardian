class GuardianProfilesController < ApplicationController

  def index
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render 'settings'}
    end
  end

  def new
    @guardian = GuardianProfile.new
  end

  def create
    @guardian = GuardianProfile.new(guardian_params)
    if @guardian.save
      redirect_to user_path(current_user)
    else
      @errors = @guardian.errors.full_messages
      render 'new'
    end
  end

  def show
    @guardian = GuardianProfile.find_by(id: params[:id])
    @memories = @guardian.memories.sort_by &:date
    @notes = @guardian.notes
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

  def destroy
    @guardian = GuardianProfile.find_by(id: params[:id])
    @guardian.destroy
    redirect_to root_path(current_user)
  end

  private
  def guardian_params
    params.require(:guardian_profile).permit(:user_id, :title, :image)
  end

end
