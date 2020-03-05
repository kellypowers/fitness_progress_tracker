class User < ActiveRecord::Base
    has_secure_password 
    has_many :workouts
    has_many :routines, through: :workouts
    has_many :goals
    validates_presence_of :name, :email, :password
    validates_uniqueness_of :email

  #   def date_printed
  #     date = self.date.to_s
  #     item = Date.parse(date)
  #     "#{Date::MONTHNAMES[item.month]} #{item.day}, #{item.year}"
  # end

  end