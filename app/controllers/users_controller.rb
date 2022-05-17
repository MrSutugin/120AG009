class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    respond_to do |format|
      if @user.save
        format.html do
          sign_in @user
          flash[:success] = "Вы успешно вошли, #{@user.name}"
          redirect_to account_path
        end
        format.json do
          render :show, status: :created, location: @user
        end
      else
        format.html do
          flash[:warning] = 'Ой... Что-то пошло не так'
          render :new, status: :unprocessable_entity
        end
        format.json do
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :first_name, :last_name, :password, :password_confirmation)
  end
end
