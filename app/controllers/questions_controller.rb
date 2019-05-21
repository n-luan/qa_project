class QuestionsController < ApplicationController

  def index
    @questions = Question.paginate(page: params[:page], per_page: 10 )
  end

end
