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
  Category.create(cat_params)
    redirect_to categories_path
end

def edit
@category = Category.find_by(id: params["id"])
end

def update
cat_params = params.require(:category).permit!
@category = Category.find_by(id: params["id"])
  @category.update(cat_params)
    redirect_to category_path
end

def destroy
    @category = Category.find_by(id: params["id"])
    @category.destroy
    redirect_to categories_path
end


end