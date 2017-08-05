class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id]        = @user.id
      application              = @user.create_application(status: :started)

      redirect_to application_path(application), success: 'Tu cuenta fue creada exitosamente. Bienvenido/a.'
    else
      flash.now[:danger] = 'Tu cuenta no pudo ser creada. Por favor intenta de nuevo.'
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
      )
  end
end
