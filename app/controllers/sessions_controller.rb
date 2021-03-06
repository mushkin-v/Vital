class SessionsController < ApplicationController

  def new
    @msg = params[:msg]
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/index'
    else
      redirect_to(:action => 'new', :msg => 'Wrong credentials!')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
