class UsersController < ApplicationController
skip_before_action :require_user, only: [:new,:create,]

def index
@population = User.all
end

def show
# do something with params
@user = User.find_by(id: params["id"])
@comments = @user.comments
end

def new
  @user = User.new
 
end

def create
user_params = params.require(:user).permit(:name, :playa_name, :email, :password, :phone, :facebook, :description)
  @user = User.create(user_params)
    if @user.valid?
      redirect_to root_path, notice: "You're account was created successfully"
    else 
      render "new"
      User.name
    end
end

def edit
@user = User.find_by(id: params["id"])
end

def update
user_params = params.require(:user).permit(:name, :playa_name, :email, :password, :phone, :facebook, :description)
  @user = User.find_by(id: params["id"])
    if @user.update_attributes(user_params)
      redirect_to user_path, notice: "You're account was updated successfully"
    else 
      render "new", alert: "Please recheck the errors below"
      User.name
    end
end

def destroy
    @user = User.find_by(id: params["id"])
    @user.destroy
    redirect_to root_path
end


end