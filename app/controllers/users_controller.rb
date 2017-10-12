class UsersController < ApplicationController
  before_action :authenticate!, except: [:create, :new]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      application       = @user.create_application(status: :started)

      UserMailer.welcome(@user).deliver_now

      redirect_to application_path(application), success: 'Tu cuenta fue creada exitosamente. Bienvenido/a.'
    else
      flash.now[:danger] = 'Tu cuenta no pudo ser creada. Por favor intenta de nuevo.'
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_back fallback_location: edit_user_path, success: 'Tu cuenta fue actualizada exitosamente.'
    else
      flash.now[:danger] = 'Tu cuenta no pudo ser actualizada. Por favor intenta de nuevo.'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :whatsapp
      )
  end
end
