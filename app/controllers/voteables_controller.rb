class VoteablesController < ApplicationController
  before_action :check_login, only: [:create, :update]

  def create
    @answer = Answer.find(params[:answer_id])
    @count_vote = @answer.count_vote
    if params[:commit] == "up"
      @count_vote += 1
      @answer.votes.create! up: true, user_id: current_user.id
    elsif params[:commit] == "down"
      @count_vote -= 1
      @answer.votes.create! down: true, user_id: current_user.id
    end
    @answer.update_attributes count_vote: @count_vote
    @vote = Vote.find_by voteable_id: @answer.id
    respond_to do |format|
      format.js
    end

  end

  def update
    @answer = Answer.find(params[:answer_id])
    @count_vote = @answer.count_vote
    if params[:commit] == "up"
      @count_vote -= 1
      current_user.votes.find_by(voteable_id: @answer.id).destroy
    elsif params[:commit] == "down"
      @count_vote += 1
      current_user.votes.find_by(voteable_id: @answer.id).destroy
    end
    @answer.update_attributes count_vote: @count_vote
    respond_to do |format|
      format.js
    end
  end

end
