Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :index, :new, :create, :edit, :update] do
    collection do
      get 'vodka'
      get 'gin'
      get 'rum'
      get 'bourbon'
      get 'scotch'
      get 'whiskey'
      get 'tequila'
      get 'brandy'
      get 'other'
    end
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
