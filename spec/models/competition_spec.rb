require 'rails_helper'

RSpec.describe Competition, type: :model do 
  describe 'relationships' do 
    it { should have_many(:teams).through(:competition_teams) }
    it { should have_many(:competition_teams) }
  end 

  before :each do 
    @final = Competition.create!(name: "Final", location: "San Antonio", sport: "Basketball")
    @semi_final = Competition.create!(name: "Semi-finals", location: "Houston", sport: "Basketball")
    @spurs = @final.teams.create!(hometown: "San Antonio", nickname: "Spurs")
    @rockets = @semi_final.teams.create!(hometown: "Houston", nickname: "Rockets")
    @player1 = @spurs.players.create!(name: "Tim Duncan", age: 30)
    @player2 = @spurs.players.create!(name: "Manu Ginobli", age: 22)
  end 

  it ".average_age" do 
    expect(Competition.average_age).to eq(26)
  end
end 