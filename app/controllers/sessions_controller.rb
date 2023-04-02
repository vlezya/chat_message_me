class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'You loggined successfuly to chatroom'
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email or password. Try again later'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfuly logout'
    redirect_to login_path
  end

  private

  def require_logged_in
    if logged_in?
      flash[:error] = 'You are alredy logged in'
      redirect_to root_path
    end
  end
end
