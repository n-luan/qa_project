class QuestionsController < ApplicationController

  def index
    @questions = Question.page(params[:page]).per(5)
  end

end
