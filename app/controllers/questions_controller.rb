class QuestionsController < ApplicationController
  before_action :question, except: [:index, :create, :new]
  before_action :authenticate_user!, only: [:index]

  def index
    @questions = Question.all
    # @scores = user.score.sort.take(5)
    # @trivia = @questions.sample
    @question = @questions.sample
    @answers = [@question.option1, @question.option2, @question.correct_ans].sort_by{rand}
    @user = current_user.score
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = "Question successfully created"
      redirect_to new_question_path
    else
      render :new
    end
  end

  private

    def question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:text, :option1, :option2, :correct_ans)
    end

end
