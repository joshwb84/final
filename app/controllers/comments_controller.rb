class CommentsController < ApplicationController
skip_before_action :require_user, only: [:show]

def index
@comments = Comment.all
end

def show
# do something with params
@tag = Comment.find_by(id: params["id"])
@comment = Comment.find_by(remark: @tag.id)
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