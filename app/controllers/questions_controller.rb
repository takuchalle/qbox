# frozen_string_literal: true

class QuestionsController < ApplicationController
  include QuestionsHelper

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
    @tweet_url = tweet_url

    set_meta_info @question
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

    if @question.image.nil?
      image = create_image(@question)
      @question.update_attribute(:image, image)
    end
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

  def tweet_url
    URI.encode("http://twitter.com/intent/tweet?original_referer=#{question_url(token: @question.token)}&url=#{question_url(token: @question.token)}&text=#{@question.content}")
  end

  def set_meta_info(q)
    set_meta_tags description: q.content
    set_meta_tags og: {
                    description: q.content,
                    url: question_url(token: params[:token]),
                    image: q.image,
                    type: "website"
                  }
    set_meta_tags twitter: {
                    card: "summary_large_image"
                  }
  end
end
