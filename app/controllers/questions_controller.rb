class QuestionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:index, :show, :new, :create]
  #need to remove and replace with solution that alows verification
  before_action :question, except: [:index, :create, :new]
  before_action :authenticate_user!, only: [:index]

  def index
    @questions = Question.all
    @question = @questions.sample
    @answers = [@question.option1, @question.option2, @question.correct_ans].sort_by{ rand }
    @user_answer = @question.user_ans

  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    respond_to do |format|
      format.html {redirect_to questions_path}
      format.js { render 'new' }
    end
  end

  def update
    params.require(:question).permit(:user_ans)
    @question.update_attributes(question_params)
    user_answer = @question.user_ans
    correct_answer = @question.correct_ans
    check_answer(user_answer, correct_answer)
  end

  def check_answer(selected, answer)
    @user = current_user
    @score = @user.score
    new_score = @score + 1
    @outcome =  selected === answer
    if @outcome
      @user.update_attribute(:score, new_score)
    end
    respond_to do |format|
      format.js { render 'check_answer' }   # This renders/executes the file
      format.html
    end
  end

  private

    def question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:text, :option1, :option2, :correct_ans, :user_ans)
    end

    def user_answer
      params.require(:question).permit(:user_ans)
    end
end
