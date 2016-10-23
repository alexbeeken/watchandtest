class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :assessments
  has_many :responses

  def reset
    self.watched_video = false
    self.finished = false
    self.save
  end

  def self.reset_all
    User.all.each do |user|
      user.reset
    end
  end

end
