class Competition < ApplicationRecord
  has_many :competition_teams 
  has_many :teams, through: :competition_teams 

  def self.average_age
    Team.joins(:players).average(:age)
    #join teams with players
    #find the average age
  end
end 