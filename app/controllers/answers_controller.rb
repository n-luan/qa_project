class AnswersController < ApplicationController
  before_action :load_question
  before_action :load_answer, except: [:new, :create, :edit, :update]

  def new; end

  def create
    answer_data = answer_params.merge(user_id: current_user.id)
    @answer = @question.answers.build answer_data
    @answer.save
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def answer_params
    params.require(:answer).permit :content, :user_id
  end

  def load_question
    @question = Question.find params[:question_id]
  end

  def load_answer
    @answer = Answer.find params[:id]
  end
end
