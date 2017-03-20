class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = ["Invalid credentials"]
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
