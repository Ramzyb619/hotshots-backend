class TeamPlayersController < ApplicationController
    def index
        team_players = TeamPlayer.all
        render json: team_players
    end 

    def create
        team_player = TeamPlayer.create(team_player_params)
        render json: team_player
    end 

    def destroy
        TeamPlayer.find(params[:id]).destroy
    end

    private

    def team_player_params
        params.require(:team_player).permit(:player_id, :team_id)
    end 
end
