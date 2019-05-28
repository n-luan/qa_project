class TagsController < ApplicationController

  def index
    @tags = Tag.all.page(params[:page]).per(60)
  end

  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions.page(params[:page]).per(20)
  end
end
