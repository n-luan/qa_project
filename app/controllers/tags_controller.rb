class TagsController < ApplicationController

  def index
    @tags = Tag.all.page(params[:page]).per(160)
  end

  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions.page(params[:page]).per(20)
  end

  def create
    @tag = Tag.create tag_params
    @tags = Tag.all.page(params[:page]).per(160)
    respond_to do |format|
      format.js
    end
  end

  private

  def tag_params
    params.require(:tag).permit :content
  end
end
