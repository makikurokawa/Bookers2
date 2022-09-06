class UsersController < ApplicationController
  def index
    @users = List.all
  end

  def show
  end

  def edit
  end
end
