require 'rails_helper'

RSpec.describe 'Competition Show' do 
  before :each do 
    @final = Competition.create!(name: "Final", location: "San Antonio", sport: "Basketball")
    @semi_final = Competition.create!(name: "Semi-finals", location: "Houston", sport: "Basketball")
    @spurs = @final.teams.create!(hometown: "San Antonio", nickname: "Spurs")
    @goldenstate = @final.teams.create!(hometown: "Oakland", nickname: "GSW")
    @rockets = @semi_final.teams.create!(hometown: "Houston", nickname: "Rockets")
    @player1 = @spurs.players.create!(name: "Tim Duncan", age: 30)
    @player2 = @spurs.players.create!(name: "Manu Ginobli", age: 30)
    @player3 = @goldenstate.players.create!(name: "Steph Curry", age: 30)
    
    visit "/competitions/#{@final.id}"
  end 
  describe 'When I visit a competitions show page' do 
    it 'can see competitions name location and sport' do 
      expect(page).to have_content(@final.name)
      expect(page).to have_content(@final.location)
      expect(page).to have_content(@final.sport)
    end 

    it 'shows the name and hometown of all Teams' do 
      expect(page).to have_content(@spurs.hometown)
      expect(page).to have_content(@spurs.nickname)
      expect(page).to_not have_content(@rockets.nickname)
    end 

    it 'shows average age of all players in competition' do 
      save_and_open_page 
      expect(page).to have_content("30.0")
    end 

    it 'shows a text field to enter a team name' do 
      fill_in("Nickname", with: 'GSW')
      click_button 'Submit'

      expect(current_path).to eq("/competitions/#{@final.id}")
      expect(page).to have_content(@goldenstate.nickname)
    end 
  end 
end