class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assessments
  has_many :responses

  def reset
    watched_video = false
    finished = false
    save
  end

  def self.reset_all
    User.all.each do |user|
      user.reset
    end
  end

end
