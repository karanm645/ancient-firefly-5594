class CompetitionsController < ApplicationController
  def show 
    @competitions = Competition.find(params[:id])
  end
end 