class VotesController < ApplicationController
  before_action :check_login, only: [:create, :update]

  def create
    @question = Question.find(params[:question_id])
    @count_vote = @question.count_vote
    if params[:commit] == "up"
      @count_vote += 1
      @question.votes.create! up: true, user_id: current_user.id
    elsif params[:commit] == "down"
      @count_vote -= 1
      @question.votes.create! down: true, user_id: current_user.id
    end
    @question.update_attributes count_vote: @count_vote
    @vote = Vote.find_by voteable_id: @question.id
    respond_to do |format|
      format.js
    end

  end

  def update
    @question = Question.find(params[:question_id])
    @count_vote = @question.count_vote
    if params[:commit] == "up"
      @count_vote -= 1
      current_user.votes.find_by(voteable_id: @question.id).destroy
    elsif params[:commit] == "down"
      @count_vote += 1
      current_user.votes.find_by(voteable_id: @question.id).destroy
    end
    @question.update_attributes count_vote: @count_vote
    respond_to do |format|
      format.js
    end
  end

end
