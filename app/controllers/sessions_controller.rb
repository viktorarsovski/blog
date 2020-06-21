class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id

    else
      flash.now[:danger] = 'Email and password miss match'
      render :new
    end
  end

  def destroy
  end

end
