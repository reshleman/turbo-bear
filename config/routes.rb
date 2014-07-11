Rails.application.routes.draw do
  resources :short_urls, only: [:new, :create, :show]
  get "/go/:slug", to: "redirects#show"
end
