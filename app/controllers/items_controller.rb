class ItemsController < ApplicationController
def index
@inventory = Item.all 

end

def show
# do something with params
@item = Item.find_by(id: params["id"])
@category = Category.find_by(id: @item.category_id)
@comments = Comment.where(item_id: @item.id)
@users = []
@comments.each do |role|
  @users << User.find_by(id: role.user_id)
end
end

def new
end

def create
# do something with params
end

def edit
# do something with params
end

def update
# do something with params
end

def destroy
# do something with params
end






end