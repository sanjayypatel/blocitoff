class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information was updated."
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information."
      redirect_to edit_user_registration_path
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @items = @user.items
    @new_item = Item.new
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end