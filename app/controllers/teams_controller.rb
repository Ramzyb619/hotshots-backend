class TeamsController < ApplicationController
    def index
        teams = Team.all
        render json: teams
    end 

    def create
        team = Team.create(team_params)
        render json: team
    end 

    

    private

    def team_params
        params.require(:team).permit(:name, :user_id)
    end 
end
