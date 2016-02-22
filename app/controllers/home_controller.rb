class HomeController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_if_finished, except: [:thankyou, :noquestions]

  def welcome
    unless Question.first
      redirect_to "/noquestions"
    else
      @first_question_id = Question.first.id
      @user = current_user
    end
  end

  def video
    @first_question_id = Question.first.id
    @url = "https://www.youtube.com/watch?v=F4pT4s8hUVM"
  end

  def thankyou
    @user = current_user
  end

  def noquestions
    @user = current_user
  end

  private

  def check_if_finished
    if current_user.finished
      redirect_to "/noquestions"
    end
  end
end
