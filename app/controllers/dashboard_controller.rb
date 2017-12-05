class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all
    @name = current_user.name
    @questions = current_user.questions.all
    @score = current_user.score
    # @scores = @users.scores.sort.take(5)
  end

  def play
  end

  def new
  end

  def create
  end

  def show
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
