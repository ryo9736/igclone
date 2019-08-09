Rails.application.routes.draw do
  resources:sessions,only: [:new, :create, :destroy]
  resources:favorites,only: [:index,:create, :destroy]
  resources:users
  resources:posts do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
