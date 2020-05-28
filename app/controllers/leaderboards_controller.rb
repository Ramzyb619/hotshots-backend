class LeaderboardsController < ApplicationController

    def index
        leaderboard = Leaderboard.all
        render json: leaderboard
    end 
end
