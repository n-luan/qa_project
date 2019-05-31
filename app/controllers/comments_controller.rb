class CommentsController < ApplicationController
  before_action :set_commentable, only: :new
  before_action :load_comment, except: [:index, :new, :create]

  def new
    @comment = Comment.new commentable: @commentable
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = Comment.create comment_params.merge(commentable_type: comment_params[:commentable_type].classify, user_id: current_user.id)
    @commentable = @comment.commentable
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @commentable = @comment.commentable
    @comment.update comment_params
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @commentable = @comment.commentable
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :commentable_id, :commentable_type
  end

  def load_question
    @question = Question.find params[:question_id]
  end

  def set_commentable
    if params[:commentable_type] == "question"
      @commentable = Question.find params[:commentable_id]
    elsif params[:commentable_type] == "answer"
      @commentable = Answer.find params[:commentable_id]
    end
  end

  def load_comment
     @comment = Comment.find params[:id]
  end
end
