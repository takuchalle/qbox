# frozen_string_literal: true

class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_url(token: @question.token)
    else
      render 'new'
    end
  end

  def show
    @question = Question.find_by(token: params[:token])
    render_raw unless params[:raw].nil?
    render_404 if @question.nil?
  end

  def index
    @question  = Question.new
    @questions = Question.all
  end

  def edit
    @question = Question.find_by(token: params[:token])
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

  def render_raw
    render template: 'questions/raw', status: 200, layout: false, content_type: 'text/html'
  end
end
