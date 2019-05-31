class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @question.tags.build
    @categories_for_search = Category.pluck :name, :id
  end

  def create
    @categories_for_search = Category.pluck :name, :id
    @question = Question.new question_params
    category = (params[:question][:category_id])
    @category = Category.find_by id: category
    if @question.valid? & verify_recaptcha(model: @question)
      @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @count_vote = @question.count_vote
    @vote = Vote.find_by voteable_id: @question.id
  end

  def index
    @questions = Question.page(params[:page]).per(20).order("created_at desc")
  end

  private

  def question_params
    params.require(:question).permit :title, :content, :user_id, :category_id,
     :user_name, :user_email, :check, :"g-recaptcha-response", tags_attributes: [:content]
  end

end
