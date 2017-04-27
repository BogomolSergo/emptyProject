class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash.now.alert = 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_up_path, :notice => 'Logged out!'
  end

  def log_in?
    if session[:user_id] == current_user.id
      system.puts 'Logined user cant do this!'
    end
  end
end
