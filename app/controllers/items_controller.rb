class ItemsController < ApplicationController

def index
@inventories = Item.all
@inventory = @inventories.sort_by {|h| h[:category_id]}
@category = Category.all
end

def show
# do something with params
@item = Item.find_by(id: params["id"])
@comments = @item.comments
end

def new
  @item = Item.new
  @select = Category.all 
end

def create
item_params = params.require(:item).permit(:category_id, :name, :description, :storage, :identifier, :owner, :purchase_date, :purchase_price,)
  @item = Item.create(item_params)
    if @item.valid?
      redirect_to items_path, notice: "Item added successfully"
    else 
      render "new", alert: "Please recheck the errors below"
      Item.name
    end
end
    

def edit
@item = Item.find_by(id: params["id"])
end


def update
item_params = params.require(:item).permit(:category_id, :name, :description, :storage, :identifier, :owner, :purchase_date, :purchase_price,)
@item = Item.find_by(id: params["id"])
    if @item.update_attributes(item_params)
      redirect_to item_path, notice: "Item updated successfully"
    else 
      render "edit", alert: "Please recheck the errors below"
      Item.name
    end
end

def destroy
    @item = Item.find_by(id: params["id"])
    @item.destroy
    redirect_to items_path
end


end