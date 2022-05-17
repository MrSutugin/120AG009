class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:email]
    respond_to do |format|
      if user&.authenticate(params[:password])
        format.html do
          sign_in user
          flash[:success] = "Вы успешно вошли, #{user.name}"
          redirect_to account_path
        end
        format.json do
          render :show, status: :created, location: user
        end
      else
        format.html do
          flash[:warning] = 'Ой... Что-то пошло не так'
          render :new, status: :unprocessable_entity
        end
        format.json do
          render json: user.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    flash[:success] = 'Вы успешно вышли'
    sign_out
    redirect_to root_path
  end
end
