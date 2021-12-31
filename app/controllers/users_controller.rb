class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    logger.debug "*" * 50
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
