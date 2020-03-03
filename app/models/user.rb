class User < ActiveRecord::Base
    has_secure_password 
    has_many :workouts
    #as_many :workout_goals
    has_many :goals
    validates_presence_of :name, :email, :password


    def date_printed
      date = self.date.to_s
      item = Date.parse(date)
      "#{Date::MONTHNAMES[item.month]} #{item.day}, #{item.year}"
  end
  
  end