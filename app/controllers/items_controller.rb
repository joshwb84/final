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
  @item = Item.new
end

def create
item_params = params.require(:item).permit(:name, :description, :storage, :identifier, :owner, :purchase_date, :purchase_price,)
  Item.create(item_params)
    redirect_to items_path
end

def edit
@item = Item.find_by(id: params["id"])
end

def update
item_params = params.require(:item).permit(:name, :description, :storage, :identifier, :owner, :purchase_date, :purchase_price,)
@item = Item.find_by(id: params["id"])
  @item.update(item_params)
    redirect_to item_path
end

def destroy
    @item = Item.find_by(id: params["id"])
    @item.destroy
    redirect_to items_path
end


end