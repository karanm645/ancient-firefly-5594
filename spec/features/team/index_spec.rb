require 'rails_helper'
RSpec.describe 'Team Index' do 
  before :each do 
    @spurs = Team.create!(hometown: "San Antonio", nickname: "Spurs")
    @rockets = Team.create!(hometown: "Houston", nickname: "Rockets")
    visit teams_path 
  end 

  describe 'When I visit the Team Index' do 
    it 'shows the name and hometowns of all Teams' do 
      expect(page).to have_content(@spurs.hometown)
      expect(page).to have_content(@spurs.nickname)
    end 
  end 
end 