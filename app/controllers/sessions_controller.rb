class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      flash[:success] = "Вы успешно вошли, #{user.name}"
      redirect_to account_path
    else
      flash[:warning] = 'Ой... Что-то пошло не так'
      render :new
    end
  end

  def destroy
    flash[:success] = 'Вы успешно вышли'
    sign_out
    redirect_to root_path
  end
end
