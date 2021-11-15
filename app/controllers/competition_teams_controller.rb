class CompetitionTeamsController < ApplicationController
  def create 
    competition = Competition.find(params[:id])
    redirect_to "/competitions/#{params[:id]}"
  end
end 