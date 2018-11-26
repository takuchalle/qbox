class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @question  = Question.new
    @questions = Question.all
  end
end
