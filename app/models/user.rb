class User < ApplicationRecord
    has_many :leaderboards
    has_many :played_games
    has_many :games, through: :played_games
    has_many :teams 
end
