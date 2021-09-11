Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope 'v1', defaults: { format: :json } do
    resources :beverages, only: %i[index show create destroy]
    resources :ingredients, only: %i[index show update create destroy]
    resources :vending_transactions, only: %i[create], path: 'vend'
    resources :beverage_recipes, only: %i[create index]
  end
end
