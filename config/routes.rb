Rails.application.routes.draw do
  root to: "drafts#new"

  resources :players
  resources :drafts
end
