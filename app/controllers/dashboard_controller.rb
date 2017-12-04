class DashboardController < ApplicationController
  
  def index
  end

  def show
    @users = User.all
    @user = current_user
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
