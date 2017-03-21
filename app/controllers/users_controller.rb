class UsersController < ApplicationController

  def index
    if request.xhr?
      @guardians = current_user.guardian_profiles
      @guardians.each do |guardian|
        if guardian.title == request.query_string
          @memory = guardian.memories.first
        end
      end
        render '_audio', layout: false, locals: {memory: @memory} and return
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.js{}
      format.html{}
    end

  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    redirect_home
    authorize_to_view(@user.id) if @user
    @user = current_user
    @guardians = @user.guardian_profiles.sort_by &:title
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
