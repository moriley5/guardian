class GuardianProfilesController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
    @guardian = GuardianProfile.find_by(id: params[:id])
    @memories = @guardian.memories
  end

  def edit
  end

  def update
  end
end
