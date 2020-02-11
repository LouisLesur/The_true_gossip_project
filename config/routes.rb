Rails.application.routes.draw do
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:first_name', to: 'welcome#landing_page'
  get '/gossip/:id', to: 'gossip#index'
end
