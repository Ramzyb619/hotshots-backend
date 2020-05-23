Rails.application.routes.draw do
  resources :played_games
  resources :users
  resources :leaderboards
  resources :games
  resources :teams
  resources :team_players
  resources :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
