Rails.application.routes.draw do
 resources:sessions,only: [:new, :create, :destroy]
 resources:favorites,only: [:create, :destroy]
 resources:users
 resources:posts
end
