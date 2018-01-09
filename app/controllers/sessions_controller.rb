class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

end
