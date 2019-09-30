class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i(show destroy)

  def show
  end

  def destroy
    if @user == current_user
      flash[:notice] = "アカウントが削除されました" if @user.destroy
    else
      flash[:alert] = "アカウント削除に失敗しました"
    end
    redirect_to root_path
  end

private
  def set_user
    @user = User.find_by(id: params[:id])
  end

end
