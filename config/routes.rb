Rails.application.routes.draw do
  resources :short_urls, only: [:new, :create, :show]
  get "#{ENV['REDIRECT_PATH']}/:slug", to: "redirects#show"
end
