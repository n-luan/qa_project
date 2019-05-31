class SelectionsController < ApplicationController
  before_action :check_select, only: [:create]

  def create
    @answer = Answer.find(params[:answer_id])
    @answer.update_attributes select: true
    respond_to do |format|
      format.js
    end
  end

  def update
    @answer = Answer.find(params[:answer_id])
    @answer.update_attributes select: nil
    respond_to do |format|
      format.js
    end
  end

  private

  def check_select
    @answer = Answer.find(params[:answer_id])
    return if !(@answer.question.answers.find_by select: true).presence
    flash.now[:warning] = "Bạn không được chọn hai câu Best answer"
    render @answer.question_path
  end

end
