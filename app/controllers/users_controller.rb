class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to root_path, notice: '権限がありません'
    end
  end
end
