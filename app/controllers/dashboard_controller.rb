class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all
    @name = current_user.name
    @questions = Question.all
    # @scores = @users.scores.sort.take(5)
  end

  def scores
    @users = User.all
    @score = current_user.score
  end

end
