class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = ["Invalid credentials"]
      render 'new'
    end
  end
end
