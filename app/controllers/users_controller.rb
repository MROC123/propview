class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if params[:user][:current_password].present?
      if @user.update_with_password(user_params)
        redirect_to edit_profile_path, notice: "Profile successfully updated"
      else
        render :edit, status: :unprocessable_entity
      end
    else
      if @user.update_without_password(user_params)
        redirect_to edit_profile_path, notice: "Profile successfully updated"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :photo)
  end
end
