Rails.application.routes.draw do
  root to: "drafts#index"

  resources :players
  resources :drafts
end
