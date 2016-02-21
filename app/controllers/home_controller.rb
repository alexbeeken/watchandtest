class HomeController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_if_finished, except: :thankyou

  def welcome
    @user = current_user
  end

  def video
    @url = "https://www.youtube.com/watch?v=F4pT4s8hUVM"
  end

  def thankyou
    @user = current_user
  end

  private

  def check_if_finished
    if current_user.finished
      redirect_to "/thankyou"
    end
  end
end
