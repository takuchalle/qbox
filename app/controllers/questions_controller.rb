# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :only_admin, only: %i[update edit destroy]

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
    if logged_in?
      @questions = Question.all
    else
      @questions = Question.where.not(replay: nil)
    end
  end

  def edit
    @question = Question.find_by(token: params[:token])
  end

  def destroy
    Question.find_by(token: params[:token])&.destroy
    redirect_to questions_url
  end

  def update
    @question = Question.find_by(token: params[:token])
    if @question.update_attributes(question_params)
      redirect_to question_url(token: @question.token)
    else
      render 'edit'
    end
  end

  private

  def only_admin
    redirect_to question_url(token: params[:token]) unless logged_in?
  end

  def question_params
    params.require(:question).permit(:content, :replay)
  end

  def render_raw
    render template: 'questions/raw', status: 200, layout: false, content_type: 'text/html'
  end
end
