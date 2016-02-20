class HomeController < ApplicationController

  before_filter :authenticate_user!

  def welcome
    @user = current_user
  end

  def video
    @url = "https://www.youtube.com/watch?v=F4pT4s8hUVM"
  end

  def thankyou
    @user = current_user
  end

end
