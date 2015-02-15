class UsersController < ApplicationController
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
item_params = params.require(:user).permit(:name, :playa_name, :email, :password)
  User.create(item_params)
    redirect_to user_path
end

def edit
@user = User.find_by(id: params["id"])
end

def update
item_params = params.require(:user).permit(:name, :playa_name, :email, :password)
@user = User.find_by(id: params["id"])
  @user.update(item_params)
    redirect_to user_path
end

def destroy
    @user = User.find_by(id: params["id"])
    @user.destroy
    redirect_to items_path
end


end