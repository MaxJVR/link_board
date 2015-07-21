class SessionsController < ApplicationController

  def new
    # render plain: "new session"
  end

  def create
    # render plain: "create session"
    user = User.authenticate(params[:user][:email],
      params[:user][:password])

    if user
      #correct email / password
      session[:user_id] = user.id
      flash[:success] = 'You are now logged in.'
      redirect_to root_path
    else
      #wrong email or password
      flash[:danger] = 'Invalid email or password.'
      # render :new
      redirect_to login_path
    end

  end

  def destroy
    # render plain: "destroy session"
    session[:user_id] = nil
    flash[:info] = "You are logged out."
    redirect_to login_path
  end

end