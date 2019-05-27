class CommentsController < ApplicationController
  before_action :load_question
  before_action :load_comment, except: [:index, :new, :create]

  def new; end

  def create
    comment_data = comment_params.merge(user_id: current_user.id)
    @comment = @question.comments.build comment_data
    @comment.save
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment = @question.comments.update comment_params
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :user_id
  end

  def load_question
    @question = Question.find params[:question_id]
  end

  def load_comment
    @comment = Comment.find params[:id]
  end
end
