class UsersController < ApplicationController
  def new
	  @user = User.new
  end

  def show
	  @user = User.find(params[:id])
  end

  def create 
	  @user = User.new(user_params)  #not the final implementation
	  if @user.save
		  #Handle a successful save
		  log_in @user
		  flash[:success] = "Welcome to the Sample App!"
		  redirect_to @user
	  else
		  render 'new'
	  end
  end

  def edit
	  @user = User.find(params[:id])
  end

  def update
	  @user = User.find(params[:id])
	  if @user.update_attributes(user_params)
		  #Handle the succesful update
		  flash[:success] = "Profile update"
		  redirect_to @user
	  else
		  render 'edit'
	  end
  end

  private

  def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
