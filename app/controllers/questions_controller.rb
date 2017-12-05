class QuestionsController < ApplicationController
  before_action :question, except: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    user = User.find(params[:user_id])
    @questions = user.questions.all
    # @scores = user.score.sort.take(5)
    @trivia = @questions.sample
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:notice] = "Question successfully created"
      redirect_to new_user_question_path
    else
      render :new
    end
  end

  private

    def question_params
      params.require(:question).permit(:text, :answer)
    end

    def question
      @question = current_user.questions.find(params[:id])
    end

end
