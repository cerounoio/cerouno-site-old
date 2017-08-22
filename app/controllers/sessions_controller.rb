class SessionsController < ApplicationController
  def new
    redirect_to application_path(current_application) if current_user

    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      application       = @user.application

      redirect_to application_path(application), success: 'Bienvenido/a a CEROUNO.'
    else
      redirect_to login_path, danger: 'Tus datos son incorrectos. Por favor intenta de nuevo.'
    end
  end

  def destroy
    session.destroy

    redirect_to login_path, info: 'Gracias por utilizar nuestra plataforma. Te esperamos pronto.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
