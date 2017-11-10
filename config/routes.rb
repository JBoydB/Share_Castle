Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/profile" => "users#show"
  patch "/profile" => "users#update"
  
  root to: "pages#landingpage"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/castles" => "user_castles#index"
  post "/castles/invite" => "user_castles#create"
  patch "/castles" => "user_castles#update"
  delete "/castles" => "user_castles#delete"

  get "/castles/new" => "castles#new"
  post "/castles" => "castles#create"
  get "/castles/:id" => "castles#show"
  get "/castles/:id/members" => "castles#members"
  get "/castles/:id/edit" => "castles#edit"
  patch "/castles/:id" => "castles#update"
  delete "/castles/:id" => "castles#destroy"

  get "/castles/:castle_id/new" => "topics#new"
  post "castles/:castle_id/" => "topics#create"  
  get "/castles/:castle_id/:topic_id" => "topics#show"
  get "/castles/:castle_id/:topic_id/edit" => "topics#edit"
  patch "/castles/:castle_id/:topic_id" => "topics#update"
  delete "/castles/:castle_id/:topic_id" => "topics#destroy"

  get "/castles/:castle_id/:topic_id/related_topics" => "related_topics#index"
  post "/castles/:castle_id/:topic_id/related_topics" => "related_topics#create"
  delete "/castles/:castle_id/:topic_id/related_topics" => "related_topics#destroy"

  get "/castles/:castle_id/:topic_id/new" => "entries#new"
  post "/castles/:castle_id/:topic_id" => "entries#create"
  get "/castles/:castle_id/:topic_id/:entry_id/edit" => "entries#edit"
  patch "/castles/:castle_id/:topic_id/:entry_id" => "entries#update"
  delete "/castles/:castle_id/:topic_id/:entry_id" => "entries#destroy"

  get "/castles/:castle_id/:topic_id/url/new" => "urls#new"
  post "/castles/:castle_id/:topic_id/url" => "urls#create"
  get "/castles/:castle_id/:topic_id/url/:url_id/edit" => "urls#edit"
  patch "/castles/:castle_id/:topic_id/url/:url_id" => "urls#update"
  delete "/castles/:castle_id/:topic_id/url/:url_id" => "urls#destroy"
end
