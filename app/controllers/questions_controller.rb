class QuestionsController < ApplicationController

  def index
    @questions = Question.page(params[:page]).per(5)
  end

  def show
    @question = Question.find params[:id]
  end
end
