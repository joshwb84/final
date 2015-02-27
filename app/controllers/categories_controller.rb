class CategoriesController < ApplicationController

def index
@categories = Category.all 
@inventory = Item.all
end

def show
# do something with params
@category = Category.find_by(id: params["id"])
@items = @category.items
end

def new
  @category = Category.new
end

def create
cat_params = params.require(:category).permit!
  @category = Category.create(cat_params)
    if @category.valid?
      redirect_to categories_path, notice: "Category was successfully added"
    else
      render "new", alert: "Please recheck the errors below"
      Category.name
    end
end

def edit
@category = Category.find_by(id: params["id"])
end

def update
cat_params = params.require(:category).permit!
@category = Category.find_by(id: params["id"])
  @category.update(cat_params)
    if @category.valid?
      redirect_to categories_path, notice: "Category information was successfully updated"
    else
      render "edit", alert: "Please recheck the errors below"
      Category.name
    end
end

def destroy
    @category = Category.find_by(id: params["id"])
    @category.destroy
    redirect_to categories_path
end


end